# frozen_string_literal: true

module Api
  module AccuWeather
    class CurrentTemperatureUpdateService
      def initialize
        @client = Api::AccuWeather::Client.new
      end

      def refresh_info
        CurrentTemperature.first_or_initialize.update(temperature: @client.current_condition.data)
      end
    end
  end
end
