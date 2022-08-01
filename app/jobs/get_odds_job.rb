class GetOddsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    odds = OddsApi::Client.get_odds_for_week(args[0])

    odds.each do |game|
      create_game(game)
    end
  end

  private

  def create_game(game)
    home_team = Team.find_or_create_by(name: game[:home_team])
    away_team = Team.find_or_create_by(name: game[:away_team])
    commence_time = Time.zone.parse(game[:commence_time])
    home_team_points = game[:bookmakers].select { |bookie| bookie[:key] == 'unibet' }.first
    home_team_points = game[:bookmakers].select { |bookie| bookie[:key] == 'unibet' }.first[:markets].select { |market| market[:key] == "spreads" 
      }.first[:outcomes].select { |outcome| outcome[:name] == home_team.name
       }.first[:point]
    away_team_points = game[:bookmakers].select { |bookie| bookie[:key] == 'unibet' }.first[:markets].select { |market| market[:key] == "spreads" 
        }.first[:outcomes].select { |outcome| outcome[:name] == away_team.name
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
