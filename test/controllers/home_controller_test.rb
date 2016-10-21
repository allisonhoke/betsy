require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "(index) should get the home index page" do
    get :index
    assert_response :success
    assert_template :index
  end

    test "(index) should have the products with 5 star ratings" do
    Product.create(id: 1, name: "Tiny Tater Tots")
    Review.create(id: 1, rating: 5, product_id: 1)
    Review.create(id: 2, rating: 4, product_id: 1)
    Review.create(id: 3, rating: 5, product_id: 1)

    five_star_reviews = Review.where(rating: 5)

    assert five_star_reviews.count == 2
  end
end
