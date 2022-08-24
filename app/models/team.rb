class Team < ApplicationRecord
  has_many :games

  def current_week_game
    Game.where(home_team: self).or(Game.where(away_team: self)).and(Game.where(week: Week.current))
  end
end
