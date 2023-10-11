# frozen_string_literal: true

class Historical < ApplicationRecord
  validates :date_time, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}\z/ }
  validates :temperature, presence: true,
                          numericality: { greater_than: -101, less_than: 101, message: I18n.t('.wrong_temp_message') }
end
