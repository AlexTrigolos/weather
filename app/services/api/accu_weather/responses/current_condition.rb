# frozen_string_literal: true

module Api
  module AccuWeather
    module Responses
      class CurrentCondition < Base
        def data
          parsed_response.blank? ? {} : { temperature: parsed_response[0]['Temperature']['Metric']['Value'] }
        end
      end
    end
  end
end
