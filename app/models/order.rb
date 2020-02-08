class Order < ApplicationRecord
  enum status: [:cart, :paid, :shipped, :fulfilled]
  has_many :order_items
  has_many :products, through: :order_items
  has_one :shipment

  belongs_to :user

  def subtotal
    subtotal = 0
    self.order_items.each do |oi|
      subtotal += oi.quantity * oi.product.price
    end
    subtotal
  end

  def grand_total
    total = 0
    self.order_items.each do |oi|
      total += oi.quantity * (oi.product.price * (1 + oi.product.tax_class.rate))
    end
    total
  end
end