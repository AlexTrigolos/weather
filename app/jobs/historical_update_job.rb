# frozen_string_literal: true

class HistoricalUpdateJob < ApplicationJob
  def perform
    Api::AccuWeather::HistoricalUpdateService.new.refresh_info
  end
end
