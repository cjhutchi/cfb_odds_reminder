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

  def build_team_string(team, points)
    team_string = team.school
    team_string.prepend("#{team.rank} ") if team.rank.present?
    team_string.concat("(#{points})") if points.to_f <= 0
    team_string
  end

  def body
    Game.top_25_this_week.map do |game|
      home_team_string = build_team_string(game.home_team, game.home_team_points)
      away_team_string = build_team_string(game.away_team, game.away_team_points)
      "#{away_team_string} @ #{home_team_string}"
    end.join("\n")
  end
end