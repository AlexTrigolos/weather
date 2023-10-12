# frozen_string_literal: true

FactoryBot.define do
  factory :historical do
    sequence(:date_time) { '2023-07-12 00:46:22' }
    sequence(:temperature) { 12.2 }
  end
end
