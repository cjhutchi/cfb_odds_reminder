class GetOddsJob < ApplicationJob
  queue_as :default

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

  def create_game(game)
    puts "home_team: #{game[:home_team]}"
    home_team = get_team(game[:home_team])
    away_team = get_team(game[:away_team])
    commence_time = Time.zone.parse(game[:commence_time])
    home_team_points = game[:bookmakers].select { |bookie| bookie[:key] == 'unibet' }.first
    home_team_points = game[:bookmakers].select { |bookie| bookie[:key] == 'unibet' }.first[:markets].select { |market| market[:key] == "spreads" 
      }.first[:outcomes].select { |outcome| outcome[:name] == game[:home_team]
       }.first[:point]
    away_team_points = game[:bookmakers].select { |bookie| bookie[:key] == 'unibet' }.first[:markets].select { |market| market[:key] == "spreads" 
        }.first[:outcomes].select { |outcome| outcome[:name] == game[:away_team]
         }.first[:point]

    Game.create(
      home_team_id: home_team.id,
      away_team_id: away_team.id,
      commence_time: commence_time,
      home_team_points: home_team_points,
      away_team_points: away_team_points
    )
  end
end
