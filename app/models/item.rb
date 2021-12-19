class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  # 画像アップデート用のメソット
  attachment :image

   def taxin_price
     (price*1.1).round
   end

end
