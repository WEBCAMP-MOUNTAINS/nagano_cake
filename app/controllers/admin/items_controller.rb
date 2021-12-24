class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.genre_id = genre.id
    @item.save
    redirect_to admin_item_path(@item)
    byebug
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :genre_id, :is_active)
  end
end
