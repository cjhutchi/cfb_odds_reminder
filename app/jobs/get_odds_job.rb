class GetOddsJob < ApplicationJob
  queue_as :default

  ODDS_MAKER = "barstool".freeze

  def perform(*args)
    odds = OddsApi::Client.get_odds_for_week(Week.current)

    odds.each do |game|
      create_game(game)
    end
  end

  private

  def get_team(full_name)
    team = Team.find { |team| "#{team.school} #{team.mascot}" == full_name }

    return team unless team.nil?

    team = Team.find { |team| "#{team.alt_name_1} #{team.mascot}" == full_name }

    return team unless team.nil?

    team = Team.find { |team| "#{team.alt_name_2} #{team.mascot}" == full_name }

    return team unless team.nil?

    team = Team.find { |team| "#{team.alt_name_3} #{team.mascot}" == full_name }

    return team
  end

  def parse_spread(game)
    bookmakers = game[:bookmakers]
    unibet = bookmakers.find { |bookmaker| bookmaker[:key] == ODDS_MAKER }

    if unibet.present?
      spreads = unibet[:markets].find { |market| market[:key] == 'spreads' }

      if spreads.present?
        spreads[:outcomes]
      end
    end
  end

  def create_game(game)
    home_team = get_team(game[:home_team])
    away_team = get_team(game[:away_team])
    commence_time = Time.zone.parse(game[:commence_time])

    if away_team.nil?
      puts "GAME:: #{game}"
    end
    spread = parse_spread(game)

    if spread.present?
      home_team_spread = spread.find { |team| team[:name] == "#{home_team.school} #{home_team.mascot}" }

      if home_team_spread.present?
        game = Game.find_by(
          home_team_id: home_team.id,
          away_team_id: away_team.id,
          week_id: Week.current.id
        )

        if game.present?
          game.update!(
            home_team_points: home_team_spread[:point],
            away_team_points: -home_team_spread[:point]
          )
        else
          Game.create(
            home_team_id: home_team.id,
            away_team_id: away_team.id,
            commence_time: commence_time,
            home_team_points: home_team_spread[:point],
            away_team_points: -home_team_spread[:point],
            week_id: Week.current.id
          )
        end
      end
    end
  end
end
