require 'twilio-ruby'

class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # TODO: make it so it can text a list of people
    phone_number = '+16147537095'

    message = client.messages.create(
      # TODO: Date should be just current date
      body: Game.top_25_games_for(Date.parse("27-08-2022")),
      messaging_service_sid: Rails.application.credentials.dig(:twilio, :message_service_id),
      to: phone_number
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(
      Rails.application.credentials.dig(:twilio, :account_sid),
      Rails.application.credentials.dig(:twilio, :account_auth_token)
    )
  end
end
