class Forecast
  attr_reader :id, :location

  def initialize(location)
    @location = location
    @id = forecast_data[:currently][:time]
  end

  def get_coords
    @coordinates ||= GeocodeService.new(@location).coords
  end

  def current_weather
    forecast_data[:currently]
  end

  def hourly_weather
    forecast_data[:hourly]
  end

  def daily_weather
    forecast_data[:daily]
  end

  def forecast_data
    @forecast_info ||= DarkskyService.new(get_coords[:lat],get_coords[:lng]).forecast_data
  end


end
