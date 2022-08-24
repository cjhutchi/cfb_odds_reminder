class Game < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :week

  def self.top_25_this_week
    Team.where.not(rank: nil).map { |team| team.current_week_game }.flatten.uniq
  end
end
