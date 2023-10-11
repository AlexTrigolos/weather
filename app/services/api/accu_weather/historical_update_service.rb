# frozen_string_literal: true

module Api
  module AccuWeather
    class HistoricalUpdateService
      def initialize
        @client = Api::AccuWeather::Client.new
      end

      def refresh_info
        data = @client.historical.data

        ActiveRecord::Base.transaction { Historical.exists? ? update_historicals(data) : create_historicals(data) }
      end

      private

      def create_historicals(data)
        Rails.logger.debug(data)
        data.each_value do |new_data|
          Historical.create!(new_data)
        end
      end

      def update_historicals(data)
        Historical.find_each.with_index do |historical, index|
          historical.update(data[index])
        end
      end
    end
  end
end
