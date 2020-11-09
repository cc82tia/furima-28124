class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  def index
  
  end

  def show
    @item = Item.show
  end

  def new
    @item = Item.new
  end

  def create
   Item.create(item_params)
   redirect_to root_path
  end

  def edit
    @item.update(item_params)
    redirect_to root_path
  end

  def update
    @items = Item.update
  end

  def destroy
    @item = Item.destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :condition_id, :delivery_charge, :delivery_sorce_id, :days_of_ships_id, :price, :user_id, :category_id, :image, :text)
  end
  def set_message
    @item = Item.find(params[:id])
  end
end
