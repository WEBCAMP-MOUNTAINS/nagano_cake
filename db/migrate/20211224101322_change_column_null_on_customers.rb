class ChangeColumnNullOnCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :postal_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :phone_number, false
    change_column_null :customers, :is_deleted, false
  end
end
