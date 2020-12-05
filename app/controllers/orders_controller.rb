class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :get_order
  def index 
    @order = Order.new
    @item = Item.find(params[ :item_id])
  end

  # def new
  #   @item_order = ItemOrder.new
  # end

  def create
    Order.create(order_params)
    # @item_order = ItemOrder.new(order_params)
    # if @item_order.valid?
    #   @item_order.save
    #   redirect_to action: :index
    # else
    #   render action: :new
    # end
    # Address.create(address_params(item))
    # Order.create(order_params(item))
    # redirect_to action: :index
  end

  private

  def address_params(item)
    params.permit(:postal_code, 
                  :delivery_source, 
                  :city, 
                  :house_number, 
                  :building_number, 
                  :phone_number)
            .merge(item_id: item_id)
  end

  def order_params(item)
    params.require(:order).permit.(postal_code: postal_code, 
                                   delivery_source: delivery_source,
                                   city: city, 
                                   house_number: house_number, 
                                   building_name: building_name,
                                   phone_number: phone_number)
                            .merge(user_id: current_user_id,
                                   item_id: params[:item_id])
  end

  def get_order
    @order = Order.find(params[:order_id])
  end
end
