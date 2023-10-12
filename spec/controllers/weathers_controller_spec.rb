# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeathersController do
  render_views

  before do
    create(:historical, temperature: 4, date_time: '2023-12-17 00:21:21')
    create(:historical, temperature: 12)
    create(:historical, temperature: 2, date_time: '2023-07-12 00:46:23')
  end

  describe '#current' do
    context 'when all is good' do
      before { create(:current_temperature, temperature: 12) }

      it 'returns current temperature' do
        get(:current, format: :json)

        expect(response.parsed_body).to eq({ 'temperature' => 12.0 })
      end
    end
  end

  describe '#historical' do
    context 'when all is good' do
      let(:expected_result) do
        {
          'data' => [
            hash_including({ 'temperature' => 4.0, 'date_time' => '2023-12-17 00:21:21' }),
            hash_including({ 'temperature' => 12.0, 'date_time' => '2023-07-12 00:46:22' }),
            hash_including({ 'temperature' => 2.0, 'date_time' => '2023-07-12 00:46:23' })
          ]
        }
      end

      it 'returns 24 hours temperature history' do
        get(:historical, format: :json)

        expect(response.parsed_body).to match(expected_result)
      end
    end
  end

  describe '#max' do
    context 'when all is good' do
      it 'returns max historical temperature' do
        get(:max, format: :json)

        expect(response.parsed_body).to eq({ 'temperature' => 12.0 })
      end
    end
  end

  describe '#min' do
    context 'when all is good' do
      it 'returns min historical temperature' do
        get(:min, format: :json)

        expect(response.parsed_body).to eq({ 'temperature' => 2.0 })
      end
    end
  end

  describe '#avg' do
    context 'when all is good' do
      it 'returns average historical temperature' do
        get(:avg, format: :json)

        expect(response.parsed_body).to eq({ 'temperature' => 6.0 })
      end
    end
  end
end
