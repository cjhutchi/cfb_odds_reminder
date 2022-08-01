namespace :games do
  desc "Send reminders"

  task gather_odds: :environment do
    # TODO: Make this the current day (its not for debugging reasons)
    GetOddsJob.perform_now(Date.parse("22-08-2022"))
  end
end
