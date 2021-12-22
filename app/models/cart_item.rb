class CartItem < ApplicationRecord
  
  belongs_to :customers
  belongs_to :items
  
  validates :amount, presence: true
  
end
