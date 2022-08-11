class GamesController < ApplicationController
  def current_week
    games = Game.games_for_current_week.map do |game|
      {
        home_team: "#{game.home_team.school} #{game.home_team.mascot}",
        home_team_rank: rank(game.home_team.school),
        away_team: "#{game.home_team.school} #{game.home_team.mascot}",
        away_team_rank: rank(game.away_team.school),
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

  def rank(school)
    ranking = top_25.find { |rank| rank["name"] == school }

    if ranking.present?
      ranking["rank"]
    else
      nil
    end
  end

  def top_25
    @top_25 ||= CfbDataApi::Client.get_rankings
  end
end
