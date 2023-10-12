# frozen_string_literal: true

FactoryBot.define do
  factory :current_temperature do
    sequence(:temperature) { |i| rand(i) }
  end
end
