class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]
  before_action :find_item_id, only: [:show, :edit, :update, :destroy]
  before_action :only_item_user, only: [:edit, :destroy]

  before_action :sold_out, only: [:index, :show, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(set_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

    if @order.include?(@item.id) 
      redirect_to item_path
    end

  end

  def update
      if @item.update(set_item)
        redirect_to item_path
      else
        render :edit
      end
  end

  def destroy   
      @item.destroy
      redirect_to root_path
  end

  private
  def set_item
    params.require(:item).permit(:name, 
      :description, 
      :condition_id, 
      :delivery_charge_id,  
      :delivery_source_id,  
      :days_of_ships_id, 
      :price, 
      :category_id, 
      :image).merge(user_id: current_user.id)
  end

  def find_item_id
    @item = Item.find(params[:id])
  end

  def only_item_user

    unless @item.user_id.to_i == current_user.id
    redirect_to root_path
    end
  end

  def sold_out
    @order = Order.pluck(:item_id)
  end
end

