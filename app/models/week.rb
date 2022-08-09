class Week < ApplicationRecord
  def self.current
    Week.find { |week| week.end_date > Date.today }
  end
end
