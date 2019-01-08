class Api::V1::FavoritesController<ApplicationController

  def create
    if valid_api_key
      Favorite.create(favorite_params)
    else
      unauthorized_json
    end
  end

  def index
    if valid_api_key
      user = User.find_by(api_key: params[:api_key])
      render json: FavoritesSerializer.new(FavoritesFacade.new(user))
    else
      unauthorized_json
    end
  end

  def destroy
    if valid_api_key
      user = User.find_by(api_key: params[:api_key])
      user.favorites.find_by(city: params[:location]).delete
      render json: FavoritesSerializer.new(FavoritesFacade.new(user))
    else
      unauthorized_json
    end
  end

  private

  def valid_api_key
    params[:api_key] != "" && User.where(api_key: params[:api_key]).exists?
  end

  def strong_params
    params.permit(:api_key,:location)
  end

  def favorite_params
    user = User.find_by(api_key: strong_params[:api_key])
    location = strong_params[:location]
    {city: location, user_id: user.id}
  end

  def unauthorized_json
    render :json => {:error => "unauthorized"}.to_json, :status => 401
  end

end
