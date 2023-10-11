# frozen_string_literal: true

class CreateHistorical < ActiveRecord::Migration[7.0]
  def change
    create_table :historicals do |t|
      t.string :date_time, null: false
      t.float :temperature, null: false
      t.timestamps
    end
  end
end
