class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:message] = "Invalid credentials"
      redirect_to login_path
    end
  end
end