# frozen_string_literal: true

module Api
  module AccuWeather
    module Responses
      class Historical < Base
        def data
          return {} if parsed_response.blank?

          parsed_response.each_with_object({}).with_index do |(data, useful_data), index|
            date_time = Time.zone.parse(data['LocalObservationDateTime']).strftime('%Y-%m-%d %H:%M:%S')
            temperature = data['Temperature']['Metric']['Value']

            useful_data[index] = { date_time:, temperature: }
          end
        end
      end
    end
  end
end
