class ChangeColumnNullOnCartItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :customer_id, false
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :amount, false
  end
end
