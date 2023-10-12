# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CurrentTemperature do
  it { is_expected.to validate_presence_of(:temperature) }
  it { is_expected.to validate_numericality_of(:temperature).is_greater_than(-101).is_less_than(101) }
end
