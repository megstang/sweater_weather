class Api::V1::FavoritesController<ApplicationController

  def create
    if params[:api_key] != ""
      Favorite.create(favorite_params)
    else
      render :json => {:error => "unauthorized"}.to_json, :status => 401
    end
  end

  private

  def strong_params
    params.permit(:api_key,:location)
  end

  def favorite_params
    user = User.find_by(api_key: strong_params[:api_key])
    location = strong_params[:location]
    {city: location, user_id: user.id}
  end

end
