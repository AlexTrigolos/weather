# frozen_string_literal: true

class CurrentTemperature < ApplicationRecord
  validates :temperature, presence: true, numericality: { greater_than: -101, less_than: 101 }
end
