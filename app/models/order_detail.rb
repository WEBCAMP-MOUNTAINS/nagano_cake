class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true

  enum making_status: { not_startable: 0, waiting_production: 1, production: 2, complete_production: 3 }
end
