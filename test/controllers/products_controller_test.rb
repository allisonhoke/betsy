require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:narwal)
    @merchant = merchants(:teeny_merchant)
  end

  test "should get products index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get the new form for a new product for that merchant" do
    get :new, merchant_id: @merchant.id
    assert_response :success
    assert_template :new

    new_product = assigns(:product)
    assert_not_nil new_product
  end

  test "should show requested product" do
    get :show, { id: products(:cat).id }
    assert_response :success
    assert_template :show

    assert_equal assigns(:product), products(:cat)
  end

  test "should get edit form" do
    id = products(:narwal).id
    get :edit, {id: id}
    assert_response :success
    assert_template :edit
  end

  test "should update product" do
    id = products(:cat).id
    patch :update, {id: id, product: {name: "Updated Cat"} }
     assert_equal "Updated Cat", Product.find(id).name
     assert_redirected_to product_path
  end

  test "destroy should delete the product" do
    id = products(:narwal).id
    assert_difference("Product.count", -1) do
      delete :destroy, {id: id}
    end

    assert_redirected_to merchant_path
  end
end
