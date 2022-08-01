require 'twilio-ruby'

class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    phone_number = '+16147537095'

    message = client.messages.create(
      body: 'Hello from rails!',
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
