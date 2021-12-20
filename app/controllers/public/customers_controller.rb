class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    @last_name = current_customer.last_name
    @first_name = current_customer.first_name 
    @full_name = 
    @last_name_kana = current_customer.last_name_kana
    @first_name_kana = current_customer.first_name_kana
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @phone_number = current_customer.phone_number
    @encrypted_password = current_customer.encrypted_password
    @email = current_customer.email
  end
  def edit
  end
  def update
  end
  def unsubscribe
  end
  def withdraw
  end
end
