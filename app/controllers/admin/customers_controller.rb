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
     if current_customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: "内容を変更しました"
     else
      render "edit"
     end
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_customer_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
end
