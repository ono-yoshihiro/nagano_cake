class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production:2, shipping_preparation:3, shipped:4 }

  validates :customer_id, presence: true
  validates :shipping_postal_code, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_price, presence: true

end
