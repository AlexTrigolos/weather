# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HistoricalUpdateJob do
  describe '#perform' do
    let(:service) { Api::AccuWeather::HistoricalUpdateService }
    let(:instance) { instance_double(service) }

    before do
      allow(service).to receive(:new).and_return(instance)
      allow(instance).to receive(:refresh_info)
    end

    it 'performs the task' do
      described_class.new.perform
      expect(instance).to have_received(:refresh_info)
    end
  end
end
