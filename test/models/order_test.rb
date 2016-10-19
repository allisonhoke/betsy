require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = Order.new(name: "Allison", email: "allison@email.com")

    @order.order_items << OrderItem.new(quantity: 1, product_id: 1)
    @order.order_items << OrderItem.new(quantity: 1, product_id: 2)
    @order.save
  end

  test "Create an Order with all data" do

    assert @order.valid?
  end

  test "items_in_order returns the items in the order" do

    assert_equal @order.items_in_order.length, 2, "Didn't return the correct number of items in this order"
  end
end
