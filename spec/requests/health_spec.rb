# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Health API' do
  path '/health' do
    get('Returns server status') do
      tags 'Health'

      consumes 'application/json'
      produces 'application/json'

      response 200, 'If everything ok' do
        schema(type: :object, properties: { status: { example: 'OK' } })

        run_test!
      end
    end
  end
end
