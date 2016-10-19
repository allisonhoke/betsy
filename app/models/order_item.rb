class OrderItem < ActiveRecord::Base
belongs_to :product
belongs_to :order
validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def self.items_in_order(id)
    OrderItem.where(order_id: id) #returns a collection of OrderItems with specified order_id
  end
end
