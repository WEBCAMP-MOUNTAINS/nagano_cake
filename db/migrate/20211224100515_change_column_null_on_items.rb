class ChangeColumnNullOnItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :genre_id, false
    change_column_null :items, :name, false
    change_column_null :items, :image_id, false
    change_column_null :items, :description, false
    change_column_null :items, :price, false
    change_column_null :items, :is_active, false
  end
end
