require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get set_user_type" do
    get :set_user_type
    assert_response :success
  end

end
