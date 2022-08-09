class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  def self.games_for_current_week
    current_week = Week.current
    Game.where(
      commence_time: current_week.end_date - 7.days..current_week.end_date
    )
  end
end
