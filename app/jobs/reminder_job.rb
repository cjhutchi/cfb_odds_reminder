require 'twilio-ruby'

class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    phone_number = '+16147537095'

    message = client.messages.create(
      body: 'Hello from rails!',
      messaging_service_sid: ENV['TWILIO_MESSAGE_SERVICE_ID'],
      to: phone_number
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
  end
end
