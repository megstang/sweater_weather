class GiphyService

  def initialize(summaries)
    @day_1 = summaries[0]
    @day_2 = summaries[1]
    @day_3 = summaries[2]
    @day_4 = summaries[3]
    @day_5 = summaries[4]
  end

  def conn
    Faraday.new(url: "http://api.giphy.com/v1/gifs/search") do |f|
      f.adapter  Faraday.default_adapter
    end
  end

  def response(day)
    url = "?q=#{day}&api_key=#{ENV['GIPHY_API']}"
    conn.get(url)
  end

  def giphy_url(day)
    JSON.parse(response(day).body, symbolize_names: true)[:data].first[:url]
  end

  def giphy_url_array
    [giphy_url(@day_1),giphy_url(@day_2),giphy_url(@day_3),giphy_url(@day_4),giphy_url(@day_5)]
  end

end
