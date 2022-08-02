module OddsApi
  class Client
    def self.get_odds_for_week(date)
      # TODO: Break out into request builder
      host = Rails.application.credentials.dig(:odds_api, :host)
      path = Rails.application.credentials.dig(:odds_api, :path)
      api_key = Rails.application.credentials.dig(:odds_api, :api_key)

      url = URI::HTTPS.build(host: host, path: path, query: "regions=us&oddsFormat=american&markets=spreads&api_key=#{api_key}")

      JSON.parse(Net::HTTP.get(url)).map { |game| game.deep_symbolize_keys }.select do |game|
        game_date = Date.parse(game[:commence_time])
        game_date < date + 7.days &&
            game_date > date
      end
    end
  end
end