# frozen_string_literal: true

class HealthController < ApplicationController
  def status
    render(plain: 'OK')
  end
end
