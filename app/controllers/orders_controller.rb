class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :get_order
  def index 
      @order = Order.new
      @item = Item.find(params[:item_id])
  end

  def new
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_address)
    if @item_order.valid?
      @item_order.save
      redirect_to  root_path
    else  
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def order_address
    params.permit(:item_id,
      :postal_code, 
      :delivery_source_id, 
      :city, 
      :house_number, 
      :building_number, 
      :phone_number).merge(user_id:current_user.id)
    end
  

  # def get_order
  #   @order = Order.find(params[:order_id])
  # end

  # def current_user
  #    @current_user = User.find_by(id:session[:user_id])
  # end
end
