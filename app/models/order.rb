class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, through: :order_items
  validate :has_order_items?

  def has_order_items?
    OrderItem.items_in_order(self.id).length != 0
  end
end
