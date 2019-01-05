class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      render :json => {:error => "not-found"}.to_json, :status => 404
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
