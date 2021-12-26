class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.page(params[:page]).per(10)
  end

  def show
    @item  = Item.find(params[:id])
    @cart_items = CartItem.new
  end

end
