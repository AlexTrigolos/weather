# frozen_string_literal: true

class HealthController < ApplicationController
  def status
    render(json: { status: 'OK' })
  end
end
