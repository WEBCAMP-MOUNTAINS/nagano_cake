class Admin::OrdersController < ApplicationController
  
  def show
    @order= Order.find(params[:id])
    @order_detail= @order.order_details
  end
  
  def update
     @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = 'You have updated order successfully.'
      redirect_to admin_order_path
    else
      render :show
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end
end
