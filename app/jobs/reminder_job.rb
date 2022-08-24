require 'twilio-ruby'

class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # TODO: put this in a users table
    phone_numbers = [
      '+16147537095'
    ]

    phone_numbers.each do |phone_number|
      message = client.messages.create(
        body: body,
        messaging_service_sid: Rails.application.credentials.dig(:twilio, :message_service_id),
        to: phone_number
      )
    end
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(
      Rails.application.credentials.dig(:twilio, :account_sid),
      Rails.application.credentials.dig(:twilio, :account_auth_token)
    )
  end

  def body
    Game.top_25_this_week.map do |game|
      if game.home_team_points.to_i < 0
        "#{game.away_team.school } @ #{game.home_team.school} (#{game.home_team_points})"
      else
        "#{game.away_team.school} (#{game.away_team_points}) @ #{game.home_team.school}"
      end
    end.join("\n")
  end
end