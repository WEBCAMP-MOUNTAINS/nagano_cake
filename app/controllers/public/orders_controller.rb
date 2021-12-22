class Public::OrdersController < ApplicationController
  before_action :cart_item_any?, only: [:new, :comfirm]
  
  def new
    
  end
  
  def confirm
   
  end
  
  def complete
    
  end
  
  def create
    
  end
  
  def index
   
  end
  
  def show
    
  end
  
  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end
  
  
end
