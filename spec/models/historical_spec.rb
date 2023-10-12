# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Historical do
  it { is_expected.to validate_presence_of(:temperature) }
  it { is_expected.to validate_numericality_of(:temperature).is_greater_than(-101).is_less_than(101) }

  it { is_expected.to validate_presence_of(:date_time) }
  it { is_expected.to allow_value('2023-10-11 18:52:00').for(:date_time) }
end
