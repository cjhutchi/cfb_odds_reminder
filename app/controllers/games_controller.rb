class GamesController < ApplicationController
  def current_week
    render json: body.to_json
  end

  private

  def body
    {
      current_week: Week.current.number,
      games: games
    }
  end

  def games
    Game.top_25_this_week.map do |game|
      {
        home_team: "#{game.home_team.school} #{game.home_team.mascot}",
        home_team_rank: game.home_team.rank,
        away_team: "#{game.away_team.school} #{game.away_team.mascot}",
        away_team_rank: game.away_team.rank,
        commence_time: game.commence_time,
        home_team_points: game.home_team_points,
        away_team_points: game.away_team_points
      }
    end
  end
end