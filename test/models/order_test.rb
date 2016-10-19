require 'test_helper'

class OrderTest < ActiveSupport::TestCase
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
end
