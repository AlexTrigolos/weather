# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::AccuWeather::CurrentTemperatureUpdateService do
  subject(:service) { described_class.new }

  let(:url) { url_with_creds }

  describe '#refresh_info' do
    context 'when data is found' do
      before { request_stub(:get, 200, url, content('current_conditions_response.json')) }

      it 'updates current temperature info' do
        service.refresh_info

        expect(CurrentTemperature.pluck(:temperature)).to eq([6.3])
      end
    end

    context 'when data is not found' do
      before do
        create(:current_temperature, temperature: 1.1)
        request_stub(:get, 200, url, content('current_conditions_response_error.json'))
      end

      it 'not updates current temperature info' do
        service.refresh_info

        expect(CurrentTemperature.pluck(:temperature)).to eq([1.1])
      end
    end

    def content(file_name)
      File.read("spec/services/api/accu_weather/content/#{file_name}")
    end
  end
end
