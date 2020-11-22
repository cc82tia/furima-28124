class ItemsController < ApplicationController
  
  before_action :set_item, only: [:edit, :update, :destroy]
  def index
    @items = Item.all
    @items = @items.includes(:user)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    # @item = Item.destroy(params[:id])
  end

  def create
    @item = Item.new(set_item)
  if @item.save
    redirect_to root_path
  else
    @items = @items.includes(:user)
    render :new
  end
end

  def edit
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    @item = Item.update
  end

  def destroy
    @item = Item.destroy(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition_id, :delivery_charge_id, :delivery_sorce_id, :days_of_ships_id, :price, :category_id, :image).merge(user_id: current_user.id)
  end
  def set_item
    params.require(:item).permit(:name, :description, :condition_id, :delivery_charge_id, :delivery_source_id, :days_of_ships_id, :price, :category_id, :image).merge(user_id: current_user.id)
  end
end
