# frozen_string_literal: true

class WeathersController < ApplicationController
  def current
    temperature = CurrentTemperature.first.temperature
    render(json: { temperature: })
  end

  def historical
    historicals = Historical.all
    render(json: { data: historicals })
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
