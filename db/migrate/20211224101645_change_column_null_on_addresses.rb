class ChangeColumnNullOnAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :addresses, :customer_id, false
    change_column_null :addresses, :name, false
    change_column_null :addresses, :postal_code, false
    change_column_null :addresses, :address, false
  end
end
