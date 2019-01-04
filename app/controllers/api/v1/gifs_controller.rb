class Api::V1::GifsController<ApplicationController

  def index
    giphy_objects = Forecast.new(params[:location])
    render json: GiphySerializer.new(giphy_objects)
  end

end
