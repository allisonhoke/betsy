require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "Create an OrderItem with all valid data" do
    item = order_items(:item_one)

    assert item.save
    assert item.valid?
  end

  test "Cannot create an order item with no quantity" do
    item = OrderItem.new(product_id: 1, order_id: 1)

    assert_not item.save
    assert_not item.valid?
    assert item.errors.keys.include?(:quantity), "quantity is not in the errors hash"
  end

  test "Cannot create an order item with quantity less than 1" do
    item = OrderItem.new(quantity: 0, product_id: 1, order_id: 1)
    another_item = OrderItem.new(quantity: -4, product_id: 1, order_id: 1)

    assert_not item.save
    assert_not item.valid?
    assert item.errors.keys.include?(:quantity), "quantity is not in the errors hash"

    assert_not another_item.save
    assert_not another_item.valid?
    assert another_item.errors.keys.include?(:quantity), "quantity is not in the errors hash"
  end

  test "Cannot create an order_item without an associated product_id" do
    item = OrderItem.new(quantity: 1, order_id: 1)

    assert_not item.save
    assert_not item.valid?
  end

  test "Cannot create an order_item without an associated order_id" do
    item = OrderItem.new(quantity: 1, product_id: 1)

    assert_not item.save
    assert_not item.valid?
  end
end
