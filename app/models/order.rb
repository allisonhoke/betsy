class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  validate :must_have_order_items
  validates :email, format: {with: /@/}

  def must_have_order_items
    if items_in_order.length <= 0
      errors.add(:order, "Must have order items")
    end
  end

  def items_in_order
    self.order_items # returns collection of items in this order
  end

  def total
    total = 0

    items_in_order.each do |item|
      total += item.find_product.price
    end

    return total
  end
end
