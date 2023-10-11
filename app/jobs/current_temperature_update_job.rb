# frozen_string_literal: true

class CurrentTemperatureUpdateJob < ApplicationJob
  def perform
    Api::AccuWeather::CurrentTemperatureUpdateService.new.refresh_info
  end
end
