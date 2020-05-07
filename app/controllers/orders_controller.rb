class OrdersController < ApplicationController
  before_action :logged_in?
  

  def new
    @order = Order.new
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end 
  end
  #Order stores Order id + user ID
  #Order_Item stores order_id" + movie_id 

  def create
    @order = Order.new(order_params)
    @order.user_id = session[:id]
    if @order.save
      Order.find(@order.user_id)
      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    if session[:user_id]
      @current = User.find(session[:user_id])
    end 

  end

  def update
  end
  
  private
  
  def order_params
    params.require(:order).permit(:user_id, movie_ids: [])
  end

  # def require_login
  #   if !session.include? :id
  #     redirect_to login_path
  #   end
  # end
end