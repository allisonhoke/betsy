require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  # test "If a merchant is not logged in they cannot see their merchant-specific content" do
  #   session[:merchant_id] = nil  # ensure no one is logged in
  #
  #   merchant_path(id: merchants(:teeny_merchant).id)
  #   # if they are not logged in they cannot see the resource and are redirected to login.
  #   assert_redirected_to root_path
  #   assert_equal "You must be logged in first", flash[:error]
  # end
end
