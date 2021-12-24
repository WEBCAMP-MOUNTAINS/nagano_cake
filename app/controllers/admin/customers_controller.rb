class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end
  def show
    @customer = Customer.find(params[:id])
    @customers = Customer.all
  end
  def edit
    @customer = Customer.find(params[:id])
  end
  def update
     @customer = current_customer
     if current_customer.update(update_params)
    redirect_to customer_path(@customer), notice: "内容を変更しました"
     else
      render "edit"
     end

  end

end
