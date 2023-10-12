# frozen_string_literal: true

RSpec.shared_examples 'response parseable' do |path|
  before { request_stub(:get, 200, url_with_creds(path), raw_response) }

  context 'when response contains data' do
    it { expect(parsed_data).to eq(parsed_response) }
  end

  context 'when response does not contain data' do
    let(:raw_response) { [].to_json }

    it { expect(parsed_data).to eq(parsed_empty_response) }
  end
end
