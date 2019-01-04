class GiphyFacade
  attr_reader :id

  def initialize(location)
    @forecast = Forecast.new(location)
  end

  def id
    @forecast.id
  end

  def giphy_data
    @giphy_data ||= GiphyService.new(@forecast.daily_summaries).giphy_url_array
  end

  def time_summary_url
    giphy_data.zip(@forecast.daily_summaries,@forecast.daily_times)
  end

  def daily_forecasts
    time_summary_url.map do |data|
      Gif.new(data)
    end
  end

  def copyright
    Time.new.year.to_s
  end

end
