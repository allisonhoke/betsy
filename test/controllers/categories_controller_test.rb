require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:correct_category)
    @product = products(:chair)
    @product.categories << @category
  end

  test "Setup should associate category with product" do
    assert_equal @category.products.first, @product
  end

  test "Index should get index and its template" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:categories)
  end

  test "New should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  ### FINISH LATER ###
  # test "Only a logged on merchant can create a new category" do
  #
  # end

  test "Create should create category" do
    assert_difference('Category.count') do
      post :create, category: { name: "name", description: "q, d, t" }
    end

    assert_redirected_to categories_path
  end

  test "Show should show category with products attached" do
    get :show, id: @category
    assert_response :success
    assert_template :show
    assert_equal @category.products, assigns(:category_products)
  end

end
