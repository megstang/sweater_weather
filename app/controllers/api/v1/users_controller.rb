class Api::V1::UsersController<ApplicationController

  def create
    user = User.create(all_params) if matching_passwords?
    if user.save
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def matching_passwords?
    params[:password] == params[:password_confirmation]
  end

  def all_params
    user_params.merge(api_key: token)
  end

  def token
    SecureRandom.urlsafe_base64.to_s
  end


end
