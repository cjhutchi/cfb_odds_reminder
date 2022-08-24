class Week < ApplicationRecord
  has_many :games

  def self.current
    Week.find { |week| week.end_date > Date.today }
  end
end
