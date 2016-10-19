require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = Order.create(name: "Allison", email: "allison@email.com")

    @order_item_one = OrderItem.create(quantity: 1, product_id: 1, order_id: @order.id)
    @order_item_two = OrderItem.create(quantity: 1, product_id: 2, order_id: @order.id)
  end

  test "Create an Order with all data" do
    order = orders(:order_one)

    assert order.save
    assert order.valid?
  end

  # test "#has_order_items finds items(returns true) for orders with items" do
  #   OrderItem.create(quantity: 1, order_id: 1, product_id: 1)
  #   OrderItem.create(quantity: 1, order_id: 2, product_id: 1)
  #
  #   order = orders(:order_one)
  #   another_order = orders(:order_two)
  #
  #   assert_equal order.has_order_items?, true
  #   assert_equal another_order.has_order_items, true
  # end

  test "items_in_order returns the items in the order" do
    assert_equal @order.items_in_order.length, 2, "Didn't return the correct number of items in this order"
  end
end
