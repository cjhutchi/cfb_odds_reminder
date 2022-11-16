require 'rails_helper'

RSpec.describe OddsApi::Client do
  # Stub all calls to the odds API
  before do
    stub_request(:get, %r{https://api.the-odds-api.com/*.*}).
    to_return(status: 200, body: api_response, headers: {})
  end

  describe "#get_odds_for_week" do
    subject { described_class.get_odds_for_week(week) }
    let(:week) { FactoryBot.create(:week) }

    context "when there is a successful response from the API" do
      let(:api_response) { File.read('spec/api/odds_api/fixtures/successful_response.json') }
      let(:expected_result) { JSON.parse(api_response).map { |game| game.deep_symbolize_keys } }

      it { is_expected.to eq(expected_result) }
    end
  end
end