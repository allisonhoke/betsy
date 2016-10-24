require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:correct_review)
    @product = products(:cat)
    @merchant = merchants(:teeny_merchant)
  end

  test "Index should show index page for a particular product's reviews" do
    get :index, product_id: @product.id
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:reviews)
  end

  test "Index should have an @product @merchant set" do
    get :index, product_id: @product.id, merchant_id: @merchant.id

    assert assigns(:product).valid?
    assert assigns(:merchant).valid?

    assert_equal assigns(:product).id, products(:cat).id
    assert_equal assigns(:merchant).id, merchants(:teeny_merchant).id
  end

  test "New should get the new review form for a non-merchant" do
    get :new, product_id: products(:chair).id
    assert_template :new
  end

  test "New should get the new review form for a merchant who does not own the product" do
    get :new, product_id: products(:chair).id, merchant_id: @merchant.id
    assert_not_equal products(:chair).merchant_id, @merchant.id
    assert_template :new
  end

  #### Test later ####
  # test "New should render the review error page for a merchant trying to review his/her own product" do
  #   get :new, product_id: @product.id, merchant_id: @merchant.id
  #   assert_equal @product.merchant_id,0
  #   assert_template :review_error
  # end

  test "Create should create review for unauth user" do
    assert_difference('Review.count') do
      post :create, review: { rating: 4, rating_description: "bah", product_id: 1 } , product_id: 1
    end
  end

  test "Create should create review for an auth user" do
    assert_difference('Review.count') do
      post :create, review: { rating: 4, rating_description: "bah", product_id: 1 } , product_id: 1, merchant_id: merchants(:other_merchant).id
    end
  end

  test "Show should show review" do
    get :show, id: @review, product_id: @product.id
    assert_response :success
    assert_template :show
  end
end
