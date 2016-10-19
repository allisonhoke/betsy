class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  validate :has_order_items?

  def has_order_items?
    a = OrderItem.items_in_order(self.id)
    result = a.length != 0
    return result
  end
end
