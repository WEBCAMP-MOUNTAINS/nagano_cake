class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  # 画像アップデート用のメソット
  attachment :image

   def taxin_price
     (price*1.1).round
   end

end
