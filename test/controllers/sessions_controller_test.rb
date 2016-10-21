require 'test_helper'

# TODO: Check this!!!

# class SessionsControllerTest < ActionController::TestCase
#   def login_a_user
#     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
#     get :create,  {provider: "github"}
#   end
#
#   def logout_a_user
#     get :destroy, {provider: "github"}
#   end
#
#   test "(create) Can Create a user" do
#     assert_difference('User.count', 1) do
#       login_a_user
#       assert_response :redirect
#       assert_redirected_to tasks_path
#     end
#   end
#
#   test "(create) If a user logs in twice it doesn't create a 2nd user" do
#     assert_difference('User.count', 1) do
#       login_a_user
#     end
#
#     assert_no_difference('User.count') do
#       login_a_user
#       assert_response :redirect
#       assert_redirected_to tasks_path
#     end
#   end
#
#   test "(delete) Can Destroy a user" do
#     # assert_difference('User.count', -1) do
#       logout_a_user
#       assert session[:user_id].blank?, "user_id_should no longer exist"
#       assert_response :redirect
#       assert_redirected_to root_path
#     # end
#   end
#
#   test "(index) Can find a previously logged in user" do
#     login_a_user
#     previous_login = session[:user_id]
#
#     logout_a_user
#     login_a_user
#
#     new_login = session[:user_id]
#
#     assert new_login == previous_login
#   end
end
