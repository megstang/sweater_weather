class Api::V1::UsersController<ApplicationController

  def create
    user = User.create(user_params) if params[:password] == params[:password_confirmation]
    user[:api_key] = user.token
    user.save
    render json: UserSerializer.new(user)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
