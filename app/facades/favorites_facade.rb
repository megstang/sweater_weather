class FavoritesFacade
  attr_reader :id
  def initialize(user)
    @user = user
    @id = user.id
  end

  def favorites
    @user.favorites.map do |favorite|
      favorite.city
    end
  end

  def description
    favorites.map do |favorite|
      Forecast.new(favorite).current_weather
    end
  end

  def favorites_info
    zip_fav_and_desc.map do |favorite|
      Favorite.new(favorite)
    end
  end

  def zip_fav_and_desc
    favorites.zip(description)
  end



end
