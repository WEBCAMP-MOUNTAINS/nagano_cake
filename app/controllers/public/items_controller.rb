class Public::ItemsController < ApplicationController

  def index
    @items = items.all
  end

  def show
  end

end
