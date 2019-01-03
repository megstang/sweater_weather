class DarkskyService

  def initialize(lat,long)
    @lat = lat
    @long = long
  end

  def conn
    Faraday.new(url: "https://api.darksky.net/forecast/") do |f|
      f.adapter  Faraday.default_adapter
    end
  end

  def response
    url = "#{ENV['DARK_SKY_API']}/#{@lat},#{@long}"
    conn.get(url)
  end

  def forecast_data
    JSON.parse(response.body, symbolize_names: true)
  end

end
