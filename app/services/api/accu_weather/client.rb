# frozen_string_literal: true

module Api
  module AccuWeather
    class Client
      def current_condition
        Api::AccuWeather::Responses::CurrentCondition.new(get(''))
      end

      def historical
        Api::AccuWeather::Responses::Historical.new(get('historical/24'))
      end

      private

      def get(path = '')
        HTTParty.get(url(path), headers: { 'Content-Type' => 'application/json' })
      end

      def url(path)
        "http://dataservice.accuweather.com/currentconditions/v1/#{Rails.application.credentials.location_key}/#{path}?apikey=#{Rails.application.credentials.api_key}"
      end
    end
  end
end
