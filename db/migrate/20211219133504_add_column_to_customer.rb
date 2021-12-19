class AddColumnToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_culumn :customers, :last_name, :string
    add_culumn :customers, :first_name, :string
    add_culumn :customers, :last_name_kana, :string
    add_culumn :customers, :first_name_kana, :tring
    add_culumn :customers, :email, :string
    add_culumn :customers, :encrypted_password, :string
    add_culumn :customers, :postal_code, :string
    add_culumn :customers, :address, :string
    add_culumn :customers, :phone_number, :string
    add_culumn :customers, :is_deleted, :boolern
  end
end
