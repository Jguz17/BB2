class UsersController < ApplicationController
  before_action :authorized, :current_user
  skip_before_action :authorized, only: [:new, :create] # or whatever onlys you need

  def show
    @user = User.find(@current_user.id)
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      p session[:user_id]

    end
  end

  def new
      @user = User.new
  end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:id] = @user.id
        redirect_to @user
      else
       # flash[:message] = "Invalid credentials"
        render :new
      end
    end

    def edit
    @current_user
      #@user = User.find(session[:id])
    end
  
    def update
     @user = current_user 
     @user.update(params.require(:user).permit(:location))
     @user.save
     redirect_to user_path(@user)
    end


    private

    def user_params
        params.require(:user).permit(:user_name,:location,:password,:password_confirmation)
    end
end



    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #       session[:user_id] = @user.id
    #      # If user saves in the db successfully:
    #       flash[:notice] = "Account created successfully!"
    #       redirect_to @user
    #     else
    #      # If user fails model validation (duplicated user_name || empty pw)
    #      flash.now.alert = "Sorry, You couldn't create account.\nPlease make sure your username is unique and you have a password."
    #      render :new
    #     end
    #   end


      # @user = User.new(user_params)
      # if @user.save
      #   session[:user_id] = @user.id
      # #      # If user saves in the db successfully:
      #   flash[:notice] = "Account created successfully!"
      #   redirect_to @user
      # else
      #   p @user.errors.full_messages
      #   render :new
      # end
    
    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #      redirect_to user_path(@user)
    #     else
    #      render :new
    #     end
    # end