require 'test_helper'
include ApplicationHelper

class ApplicationHelperTest < ActionController::TestCase
  test "add_decimal should, you know, add a decimal" do
    assert_equal "1.10", add_decimal(110)
    assert_equal "1.00", add_decimal(100)
    assert_equal "0.90", add_decimal(90)

  end
  # no idea how to test these
  
  # test "Merchant only button should only work if someone is logged in" do
  #   session[:merchant_id] = nil
  #   assert_not merchant_only_button.valid?
  # end
  #
  # test "link_button should work with 4 or 3 parameters" do
  #   assert link_button("root_path","asdfsadf",:get).valid?
  #   assert link_button("product_path","asdfasd",:get,products(:chair)).valid?
  # end
end
