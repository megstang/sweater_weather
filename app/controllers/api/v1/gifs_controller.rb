class Api::V1::GifsController<ApplicationController

  def index
    giphy_objects = Forecast.new(params[:location]).giphy_service_objects
    render json: GiphySerializer.new(giphy_objects)
  end

end
