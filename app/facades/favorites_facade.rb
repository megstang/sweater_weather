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

  def current_weather(favorite)
    Forecast.new(favorite).current_weather
  end

  def favorites_and_weather
    favorites.inject(Hash.new(0)) do |hash, favorite|
      hash[favorite] = current_weather(favorite)
      hash
    end
  end


end
