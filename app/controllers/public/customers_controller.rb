class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    # エラー中
    if current_customer.update(update_params)
    redirect_to customer_path(@customer), notice: "内容を変更しました"
    else
      render "edit"
    end

  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
  end

private

def customer_params
   params.require(:customer).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,:email)
   params.require(:customer).permit(:active)
end

def update_params
  params.require(:customer).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,:email)
end
end