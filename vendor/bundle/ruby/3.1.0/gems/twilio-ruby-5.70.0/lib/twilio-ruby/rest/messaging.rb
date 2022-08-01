##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Messaging < Domain
      ##
      # Initialize the Messaging Domain
      def initialize(twilio)
        super

        @base_url = 'https://messaging.twilio.com'
        @host = 'messaging.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of messaging
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid The unique string to identify Brand Registration.
      # @return [Twilio::REST::Messaging::V1::BrandRegistrationInstance] if sid was passed.
      # @return [Twilio::REST::Messaging::V1::BrandRegistrationList]
      def brand_registrations(sid=:unset)
        self.v1.brand_registrations(sid)
      end

      ##
      # @return [Twilio::REST::Messaging::V1::DeactivationsInstance]
      def deactivations
        self.v1.deactivations()
      end

      ##
      # @return [Twilio::REST::Messaging::V1::ExternalCampaignInstance]
      def external_campaign
        self.v1.external_campaign()
      end

      ##
      # @param [String] sid The unique string that we created to identify the Service
      #   resource.
      # @return [Twilio::REST::Messaging::V1::ServiceInstance] if sid was passed.
      # @return [Twilio::REST::Messaging::V1::ServiceList]
      def services(sid=:unset)
        self.v1.services(sid)
      end

      ##
      # @return [Twilio::REST::Messaging::V1::UsecaseInstance]
      def usecases
        self.v1.usecases()
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Messaging>'
      end
    end
  end
end