# frozen_string_literal: true

class CreateCurrentTemperature < ActiveRecord::Migration[7.0]
  def change
    create_table :current_temperatures do |t|
      t.float :temperature, null: false
      t.timestamps
    end
  end
end
