require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @merchant = Merchant.create(username: "Merchant", email: "a@b.com")
    @merchant_two = Merchant.create(username: "Merchant TWO", email: "two@b.com")
    @order = orders(:order_one)
    @product = Product.create(name: "Product", price: 1234, merchant_id: @merchant.id, stock: 4)
    @order_item = OrderItem.create(quantity: 2, order_id: @order.id, product_id: @product.id)
  end

  test "should show order" do
    get :show, id: @order.id
    assert_response :success
  end

  test "should show merchant_view to correct merchant" do
    session[:merchant_id] = @merchant.id
    get :merchant_view, :merchant_id => session[:merchant_id], id: @order.id
    assert_template :merchant_view
  end

  test "won't show merchant view to an invalid merchant" do
    session[:merchant_id] = @merchant_two.id
    get :merchant_view, :merchant_id => session[:merchant_id], id: @order.id
    assert_template :view_error
  end

  test "won't show merchant view to a non-logged-in user" do
    session[:merchant_id] = nil
    get :merchant_view, :merchant_id => session[:merchant_id], id: @order.id
    assert_template :view_error
  end

  test "should get edit" do
    get :edit, id: @order.id
    assert_response :success
  end

  test "trying to edit an order deleted or not there should be redirected" do
      # 1st delete the item
    delete :destroy, id: orders(:order_one).id
      # Try to edit the item that's not there.
    get :edit, id: orders(:order_one).id
    assert_response :redirect
    assert_equal "That item does not exist.", flash[:notice]
  end

  test "should update order" do
    patch :update, id: @order, order: {name: "Allison"}
    assert_redirected_to confirmation_path(@cart)
  end

  test "#purchase should change the order status to paid" do
    get :purchase, id: @order
    assert_equal @order.status, "paid"
  end

  test "#purchase should render the correct view" do
    get :purchase, id: @order
    assert_template :purchase
  end

  test "#purchase will reduce the stock of the products in the order" do
    get :purchase, id: @order
    assert_equal @product.stock, 2
  end

  test "#purchase clears the cart" do
    get :purchase, id: @order
    assert_equal session[:order_id], nil
  end
end
