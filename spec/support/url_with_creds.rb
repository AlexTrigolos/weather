# frozen_string_literal: true

def url_with_creds(path = '')
  location_key = Rails.application.credentials.location_key
  api_key = Rails.application.credentials.api_key
  "dataservice.accuweather.com/currentconditions/v1/#{location_key}#{path}?apikey=#{api_key}"
end
