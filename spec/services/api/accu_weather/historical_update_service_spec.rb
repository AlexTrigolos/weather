# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::AccuWeather::HistoricalUpdateService do
  subject(:service) { described_class.new }

  let(:url) { url_with_creds('/historical/24') }

  describe '#refresh_info' do
    shared_examples 'check historical data' do
      let(:expected_result) do
        [
          { 'date_time' => '2023-10-11 18:58:00', 'temperature' => 6.1 },
          { 'date_time' => '2023-10-11 17:58:00', 'temperature' => 6.2 }
        ]
      end

      it 'refresh historical info' do
        service.refresh_info

        expect(Historical.all.as_json(only: %i[temperature date_time])).to eq(expected_result)
      end
    end

    before do
      Historical.destroy_all
      request_stub(:get, 200, url, content('historicals_response.json'))
    end

    context 'when data is found' do
      it_behaves_like 'check historical data'
    end

    context 'when data is found but old info exists' do
      before do
        create(:historical)
        create(:historical, date_time: '2023-04-12 00:46:22', temperature: -41.1)
        request_stub(:get, 200, url, content('historicals_response.json'))
      end

      it_behaves_like 'check historical data'
    end

    context 'when data is not found' do
      before do
        create(:historical)
        create(:historical, date_time: '2023-04-12 00:46:22', temperature: -41.1)
        request_stub(:get, 200, url, content('historicals_response_error.json'))
      end

      let(:expected_result) do
        [
          { 'date_time' => '2023-07-12 00:46:22', 'temperature' => 12.2 },
          { 'date_time' => '2023-04-12 00:46:22', 'temperature' => -41.1 }
        ]
      end

      it 'not refresh historical info' do
        service.refresh_info

        expect(Historical.all.as_json(only: %i[temperature date_time])).to eq(expected_result)
      end
    end

    def content(file_name)
      File.read("spec/services/api/accu_weather/content/#{file_name}")
    end
  end
end
