class GameController < ApplicationController
  def index
    # TODO: Probably should split this out into a presenter
    response = Game.games_for_current_week.map do |game|
      {
        home_team: game.home_team.name,
        away_team: game.away_team.name,
        commence_time: game.commence_time,
        home_team_points: game.home_team_points,
        away_team_points: game.away_team_points
      }
    end
    render json: response.to_json
  end
end
