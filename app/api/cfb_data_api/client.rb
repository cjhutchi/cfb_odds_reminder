module CfbDataApi
  class Client
    POLL_NAME = "AP Top 25".freeze

    def self.get_rankings
      api_key = Rails.application.credentials.dig(:cfb_data_api, :api_key)
      # Currently no rankings yet
      # current_year = Time.zone.now.year
      current_year = 2021
      current_week = Week.current.number

      uri = URI("https://api.collegefootballdata.com/rankings?year=#{current_year}&week=#{current_week}&seasonType=regular")

      parse_rankings(
        JSON.parse(
          Net::HTTP.get(uri, {'Authorization' => "Bearer #{api_key}"})
        )
      )
    end

    def self.teams
      api_key = Rails.application.credentials.dig(:cfb_data_api, :api_key)
      uri = URI("https://api.collegefootballdata.com/teams")

      JSON.parse(
        Net::HTTP.get(uri, {'Authorization' => "Bearer #{api_key}"})
      )
    end

    private

    def self.parse_rankings(response)
      response.first["polls"].find do |poll|
        poll["poll"] == POLL_NAME
      end["ranks"]
    end
  end
end