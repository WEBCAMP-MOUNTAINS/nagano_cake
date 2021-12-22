class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to customer_path(@customer.id), notice: "内容を変更しました"
    else
      render "edit"
    end

  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer.update(is_deleted: true)
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        reset_session
        redirect_to root_path
  end

private

def customer_params
   params.require(:customer).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,:email)
   params.require(:customer).permit(:active)
end
end