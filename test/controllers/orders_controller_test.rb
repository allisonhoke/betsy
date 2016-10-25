require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:order_one)
  end

  test "should show order" do
    get :show, id: @order.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order.id
    assert_response :success
  end

  # test ""

  # test "should update order" do
  #   patch :update, id: @order, order: {  }
  #   assert_redirected_to order_path(assigns(:order))
  # end

end
