namespace :weekly_tasks do
  desc "Send reminders"

  task load_odds: :environment do
    GetOddsJob.perform_now
  end

  task load_rankings: :environment do
    RankingsJob.perform_now
  end

  task send_reminder_texts: :environment do
    ReminderJob.perform_now
  end
end
