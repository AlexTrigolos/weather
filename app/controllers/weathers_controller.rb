# frozen_string_literal: true

class WeathersController < ApplicationController
  def current
    current_temperature = CurrentTemperature.first
    render(json: current_temperature, only: :temperature)
  end

  def historical
    historicals = Historical.all
    render(json: historicals)
  end

  def max
    temperature = Historical.maximum(:temperature)
    render(json: { temperature: })
  end

  def min
    temperature = Historical.minimum(:temperature)
    render(json: { temperature: })
  end

  def avg
    temperature = Historical.average(:temperature)
    render(json: { temperature: })
  end
end
