require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get user_home" do
    get :user_home
    assert_response :success
  end

  test "should get admin_home" do
    get :admin_home
    assert_response :success
  end

end
