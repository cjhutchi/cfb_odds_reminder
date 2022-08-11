namespace :games do
  desc "Send reminders"

  task gather_odds: :environment do
    GetOddsJob.perform_now
  end
end
