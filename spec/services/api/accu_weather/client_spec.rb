# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::AccuWeather::Client do
  subject(:service) { described_class.new }

  let(:parsed_empty_response) { {} }

  describe '#historical' do
    let(:raw_response) { content('historicals_response.json') }
    let(:parsed_data) { service.historical.data }

    let(:parsed_response) do
      {
        0 => { date_time: '2023-10-11 18:58:00', temperature: 6.1 },
        1 => { date_time: '2023-10-11 17:58:00', temperature: 6.2 }
      }
    end

    it_behaves_like 'response parseable', '/historical/24'
  end

  describe '#current_condition' do
    let(:raw_response) { content('current_conditions_response.json') }
    let(:parsed_data) { service.current_condition.data }

    let(:parsed_response) { { temperature: 6.3 } }

    it_behaves_like 'response parseable', ''
  end

  def content(path)
    File.read("spec/services/api/accu_weather/content/#{path}")
  end
end
