require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @product1 = Product.create(name: "cat", price: 1000)
    @product2 = Product.create(name: "dog", price: 1234)
    @order = Order.create(name: "Allison", email: "allison@email.com")

    @order.order_items << OrderItem.new(quantity: 1, product_id: @product1.id)
    @order.order_items << OrderItem.new(quantity: 1, product_id: @product2.id)
  end

  test "Create an Order with all data" do
    assert @order.valid?
  end

  test "#items_in_order returns the items in the order" do
    assert_equal @order.items_in_order.length, 2, "Didn't return the correct number of items in this order"
  end

  test "#total returns the correct total of an order" do
    assert_equal @order.total, 2234, "Didn't return the correct total"
  end

  # test "doesn't create an order with an invalid email address" do
  #   invalid_order = Order.new(name: "Allison", email: "AllisonHoke")
  #
  #   assert_not invalid_order.save
  #   assert_not invalid_order.valid?
  # end
end
