class Api::V1::GifsController<ApplicationController

  def index
    render json: GiphySerializer.new(GiphyFacade.new(params[:location]))
  end

end
