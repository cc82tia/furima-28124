class OrdersController < ApplicationController

  def index
    # @item_order = ItemOrder.new
    # @item = Item.find(params[:id])
  end

  # def new
  #   @item_order = ItemOrder.new
  # end

  def create
    @item = Item.find(params[:id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to action: :index
    else
      render action: :new
    end
    Address.create(address_params(item))
    Order.create(order_params(item))
    redirect_to action: :index
  end

  private

  def address_params(item)
    params.permit(:postal_code, :delivery_source, :city, :house_number, :building_number, :phone_number).merge(item_id: item.id)
  end

  def order_params(item)
    params.require(:item_order).permit.(postal_code: postal_code, 
                                        delivery_source_id: delivery_source_id,
                                         city: city, 
                                         house_number: house_number, 
                                         building_name: building_name,
                                         user_id: user.id,
                                         item_id: item_id)
  end
end
