class OrdersController < ApplicationController
  before_action :require_login

  def new
    @order = Order.new
    @user = User.find(session[:id])
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

  
  private
  
  def order_params
    # params.require(:order).permit(user_id: [], movie_ids: [])
    params.require(:order).permit(user_id: [], movie_ids: [])
  end

  def require_login
    if !session.include? :id
      redirect_to login_path
    end
end
end