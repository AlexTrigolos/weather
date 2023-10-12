# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthController do
  render_views

  describe '#status' do
    context 'when forever' do
      it 'returns OK' do
        get(:status, format: :json)

        expect(response.parsed_body).to eq({ 'status' => 'OK' })
      end
    end
  end
end
