require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  setup do
    @order_item = order_items(:item_one)
  end

  test "should update order_item" do
    patch :update, id: @order_item, order_item: {  }
    assert_redirected_to order_path#(assigns(:order_item))
  end

  # test "should destroy order_item" do
  #   assert_difference('OrderItem.count', -1) do
  #     delete :destroy, id: @order_item
  #   end
  #
  #   assert_redirected_to order_items_path
  # end
end
