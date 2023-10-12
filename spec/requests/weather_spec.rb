# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Weather API', :skip_rswag do
  path '/weather/current' do
    get('Returns current temperature') do
      tags 'Current'

      consumes 'application/json'
      produces 'application/json'

      response 200, 'If everything ok' do
        schema(type: :object, properties: { temperature: { example: 0 } })

        run_test!
      end
    end
  end

  path '/weather/historical' do
    get('Returns historical temperature data for the last 24 hours') do
      tags 'Historical'

      consumes 'application/json'
      produces 'application/json'

      response 200, 'If everything ok' do
        schema(
          type: :object,
          properties: { data: { type: :array, items: { '$ref' => '#/components/schemas/Historical' } } }
        )

        run_test!
      end
    end
  end

  path '/weather/historical/min' do
    get('Returns minimum temperature for the last 24 hours') do
      tags 'Historical'

      consumes 'application/json'
      produces 'application/json'

      response 200, 'If everything ok' do
        schema(type: :object, properties: { temperature: { example: 0 } })

        run_test!
      end
    end
  end

  path '/weather/historical/max' do
    get('Returns maximum temperature for the last 24 hours') do
      tags 'Historical'

      consumes 'application/json'
      produces 'application/json'

      response 200, 'If everything ok' do
        schema(type: :object, properties: { temperature: { example: 0 } })

        run_test!
      end
    end
  end

  path '/weather/historical/avg' do
    get('Returns average temperature for the last 24 hours') do
      tags 'Historical'

      consumes 'application/json'
      produces 'application/json'

      response 200, 'If everything ok' do
        schema(type: :object, properties: { temperature: { example: 0 } })

        run_test!
      end
    end
  end
end
