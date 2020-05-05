class OrdersController < ApplicationController
  def new
    
    @order = Order.new
  end

  def create
    @order = Order.create!(order_params)
    redirect_to order_path(@order)
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(user_id: [], movie_ids: [])
  end
end