namespace :reminder do
  desc "TODO"
  task cfb_odds: :environment do
    ReminderJob.perform_now
  end
end
