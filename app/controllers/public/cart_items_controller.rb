class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @customer_cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "個数の変更が完了しました"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "#{@cart_item.item.name}を削除しました"
  end

  def destroy_all
    if CartItem.destroy_all
      redirect_to cart_items_path, notice: "カート内を全て削除しました"
    end
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @item = @cart_item.item

      # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
    @update_cart_item =  CartItem.find_by(item_id: @cart_item.item.id)
    if @update_cart_item.present?
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end
    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
      redirect_to cart_items_path
    else
      redirect_to item_path(@item), notice: "商品の個数を指定してください"
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :amount, :item_id)
  end

end