require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  setup do
    @order_item = OrderItem.create(quantity: 2, product_id: 1, order_id: 1)
    @another_order_item = OrderItem.create(quantity: 1, product_id: 2, order_id: 1)
    @order = Order.create(name: "Allison",  email: "a@b.com")
  end

  test "should be able to create a new order item" do
    @product = Product.create(name: "product", price: 1234)
    @cart = Order.create(name: "name", email: "email@email.com")
    post :create, :product_id => @product.id, order_item: {quantity: 2}
    assert_response :redirect
    assert_redirected_to order_path
  end

  test "Newly created order items should have the right fields" do
    @product = Product.create(name: "product", price: 1234)
    post :create, :product_id => @product.id, order_item: {quantity: 3}

    item = OrderItem.find_by(quantity: 3)
    sample_item = OrderItem.new(quantity: 3, product_id: @product.id)

    assert_equal item.quantity, sample_item.quantity
    assert_equal item.product_id, sample_item.product_id
  end

  test "creating a new item should change the total number of items" do
    @product = Product.create(name: "product", price: 1234)
    assert_difference('OrderItem.count', 1) do
      post :create, :product_id => @product.id, order_item: {quantity: 3}
    end
  end

  test "renders correct template if create fails to save" do
    @product = Product.create(name: "product", price: 1234)
    post :create, :product_id => @product.id, order_item: {quantity: -3}

    assert_template :failed_order_update
  end

  test "should update order_item" do
    patch :update, id: @order_item, order_item: {quantity: 4}

    assert_response :redirect
    assert_redirected_to order_path
  end

  test "should render correct template if order_item quantity update fails to save" do
    patch :update, id: @order_item, order_item: {quantity: -123}

    assert_template :failed_order_update
  end

  test "should destroy order_item" do
    assert_difference('OrderItem.count', -1) do
      delete :destroy, id: @another_order_item
    end

    assert_redirected_to order_path
  end
end
