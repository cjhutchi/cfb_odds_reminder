FactoryBot.define do
  factory :week do
    start_date { Date.today }
    end_date { Date.today + 7.days }
    number { 1 }
  end
end
