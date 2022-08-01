namespace :reminder do
  desc "Send reminders"

  task cfb_odds: :environment do
    ReminderJob.perform_now
  end
end
