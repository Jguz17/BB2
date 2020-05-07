class ApplicationController < ActionController::Base

  # helper_method :current_user, :logged_in?
  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      p @current_user
      p "------"
      p session[:user_id] 
      p "++++++"
    end
  end
  
  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
  
  def destroy
    session.delete(:user_id) # or session[:user_id] = nil
  end
end
