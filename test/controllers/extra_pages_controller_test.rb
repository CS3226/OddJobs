require 'test_helper'

class ExtraPagesControllerTest < ActionController::TestCase
  test "should get contactUs" do
    get :contactUs
    assert_response :success
  end

end
