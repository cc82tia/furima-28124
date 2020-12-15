class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :only_item_user 
  before_action :double_sale
  def index
        @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to  root_path
    else  
      render action: :index
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:postal_code, 
      :delivery_source_id, 
      :city, 
      :house_number, 
      :building_number, 
      :phone_number).merge(user_id:current_user.id, token: params[:token],item_id: params[:item_id])
    end

  def only_item_user
    item_find
    if @item.user_id.to_i == current_user.id
    redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,                # 商品の値段
        card: item_order_params[:token],    # カードトークン
        currency: 'jpy'                     # 通貨の種類（日本円）
      )
  end

  def double_sale  
    @order = Order.pluck(:item_id)
    if  @order.include?(@item.id)
      redirect_to root_path
    end
  end
end
