##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Wireless
      class V1 < Version
        ##
        # Initialize the V1 version of Wireless
        def initialize(domain)
          super
          @version = 'v1'
          @usage_records = nil
          @commands = nil
          @rate_plans = nil
          @sims = nil
        end

        ##
        # @return [Twilio::REST::Wireless::V1::UsageRecordContext]
        def usage_records
          @usage_records ||= UsageRecordList.new self
        end

        ##
        # @param [String] sid The SID of the Command resource to fetch.
        # @return [Twilio::REST::Wireless::V1::CommandContext] if sid was passed.
        # @return [Twilio::REST::Wireless::V1::CommandList]
        def commands(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @commands ||= CommandList.new self
          else
              CommandContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The SID of the RatePlan resource to fetch.
        # @return [Twilio::REST::Wireless::V1::RatePlanContext] if sid was passed.
        # @return [Twilio::REST::Wireless::V1::RatePlanList]
        def rate_plans(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @rate_plans ||= RatePlanList.new self
          else
              RatePlanContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The SID or the `unique_name` of the Sim resource to fetch.
        # @return [Twilio::REST::Wireless::V1::SimContext] if sid was passed.
        # @return [Twilio::REST::Wireless::V1::SimList]
        def sims(sid=:unset)
          if sid.nil?
              raise ArgumentError, 'sid cannot be nil'
          end
          if sid == :unset
              @sims ||= SimList.new self
          else
              SimContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Wireless::V1>'
        end
      end
    end
  end
end