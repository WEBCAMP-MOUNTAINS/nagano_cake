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
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_deposit: 0, payment_confirmation: 1, production: 2, preparing_ship: 3, sent: 4 }
  
end
