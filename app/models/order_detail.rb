class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: { cannot_produce: 0, waiting_for_production: 1, in_production:2, production_completed:3 }

  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :purchase_price, presence: true
  validates :amount, presence: true

end
