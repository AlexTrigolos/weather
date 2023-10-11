# frozen_string_literal: true

desc 'Upload data after migration'
task(upload_data: :environment) do
  Api::AccuWeather::CurrentTemperatureUpdateService.new.refresh_info
  Api::AccuWeather::HistoricalUpdateService.new.refresh_info
end
