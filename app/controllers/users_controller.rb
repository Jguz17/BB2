class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        if session[:user_id]
          @current = User.find(session[:user_id])
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
        session[:user_id] = @user.id
      #      # If user saves in the db successfully:
        flash[:notice] = "Account created successfully!"
        redirect_to @user
      else
        p @user.errors.full_messages
        render :new
      end
    end
    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #      redirect_to user_path(@user)
    #     else
    #      render :new
    #     end
    # end

    private

    def user_params
        params.require(:user).permit(:user_name, :password,:password_confirmation)
    end
end