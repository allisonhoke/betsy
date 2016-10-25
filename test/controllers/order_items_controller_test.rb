require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  setup do
    @order_item = OrderItem.create(quantity: 2, product_id: 1, order_id: 1)
    @another_order_item = OrderItem.create(quantity: 1, product_id: 2, order_id: 1)
    @order = Order.create(name: "Allison",  email: "a@b.com")
  end

  # test "should update order_item" do
  #   patch :update, id: order_items(:item_one), item_one: {quantity: 4, product_id: 1, order_id: 1}
  #
  #   assert_response :success
  #   assert_template 'orders/show'
  # end

  test "should destroy order_item" do
    assert_difference('OrderItem.count', -1) do
      delete :destroy, id: @another_order_item
    end

    # assert_redirected_to order_path(@order)
  end
end
