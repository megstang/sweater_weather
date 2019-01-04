class Gif
  attr_reader :time,
              :summary,
              :url
              
  def initialize(array)
    @time = array[2]
    @summary = array[1]
    @url = array[0]
  end
end
