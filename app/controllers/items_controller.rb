class ItemsController < ApplicationController
  before_action :find_item_id, only: [:show, :edit]
  before_action :set_item, only: [:update, :destroy, :create]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = find_item_id
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
    @item = find_item_id
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(set_item)
        redirect_to item_path
      else
        render :edit
      end
  end
  # def destroy
  #   @item = Item.find(params[:id])
  #   @item = Item.destroy(set_item)
  # end

  private
  def set_item
    params.require(:item).permit(:name, :description, :condition_id, :delivery_charge_id,  :delivery_source_id,  :days_of_ships_id, :price, :category_id, :image ).merge(user_id: current_user.id)
  end

  def find_item_id
    Item.find(params[:id])
  end
end
