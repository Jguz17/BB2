class UsersController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create] # or whatever onlys you need

  def show
      @user = User.find(params[:id])
      if session[:user_id]
        @current = User.find(session[:user_id])
        p session[:user_id]
        p "----------"
      end
    end

    def new
        @user = User.new
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
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      if @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
    private

    def user_params
        params.require(:user).permit(:user_name, :password,:password_confirmation)
    end
end