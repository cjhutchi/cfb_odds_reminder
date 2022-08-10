class GamesController < ApplicationController
  def current_week
    games = Game.games_for_current_week.map do |game|
      {
        home_team: team_name(game.home_team.name),
        away_team: team_name(game.away_team.name),
        commence_time: game.commence_time,
        home_team_points: game.home_team_points,
        away_team_points: game.away_team_points
      }
    end

    response = {
      current_week: Week.current.number,
      games: games
    }

    render json: response.to_json
  end

  private

  def team_name(name)
    ranking = top_25.find { |rank| name.starts_with?(rank["school"]) }

    if ranking.present?
      "#{ranking["rank"]} #{name}"
    else
      name
    end
  end

  def top_25
    @top_25 ||= CfbDataApi::Client.get_rankings
  end
end
