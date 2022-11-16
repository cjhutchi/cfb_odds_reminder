require 'rails_helper'

RSpec.describe CfbDataApi::Client do
  # Stub all calls to the odds API
  before do
    stub_request(:get, %r{https://api.collegefootballdata.com}).
    to_return(status: 200, body: api_response, headers: {})
  end

  describe "#teams" do
    subject { described_class.teams }

    context "when the response is successful" do
      let(:api_response) { File.read('spec/api/cfb_data_api/fixtures/teams_successful_response.json') }
      let(:expected_result) { JSON.parse(api_response) }

      it { is_expected.to eq(expected_result) }
    end
  end

  describe "#get_rankings" do
    subject { described_class.get_rankings }
    let(:current_week) { FactoryBot.create(:week) }

    before do
      allow(Week).to receive(:current).and_return(current_week)
    end
    context "when the response is successful" do
      let(:api_response) { File.read('spec/api/cfb_data_api/fixtures/get_rankings_successful_response.json') }
      let(:expected_result) { JSON.parse(File.read('spec/api/cfb_data_api/fixtures/parsed_rankings.json')) }

      it { is_expected.to eq(expected_result) }
    end
  end
end