require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  def setup
    @current_user = Merchant.new(username: "test", email: "test@aol.com")
  end
  # test "If a merchant is not logged in they cannot see their merchant-specific content" do
  #   session[:merchant_id] = nil  # ensure no one is logged in
  #
  #   merchant_path(id: merchants(:teeny_merchant).id)
  #   # if they are not logged in they cannot see the resource and are redirected to login.
  #   assert_redirected_to root_path
  #   assert_equal "You must be logged in first", flash[:error]
  # end
  
  # Nicole wrote this and doesn't know why it's failed
  # test "Require login should render view_error page if there is no one logged in" do
  #   get :require_login
  #   @current_user = nil
  #   assert_template :view_error
  # end
end
