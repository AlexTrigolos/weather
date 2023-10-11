# frozen_string_literal: true

module Api
  module AccuWeather
    module Responses
      class Base
        def initialize(raw_response)
          @raw_response = raw_response
        end

        private

        def parsed_response
          @raw_response.parsed_response
        end
      end
    end
  end
end
