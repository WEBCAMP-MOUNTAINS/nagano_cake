class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  belongs_to :customers
  
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shopping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :order_status, presence: true
  
end
