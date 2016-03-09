require 'test_helper'

class HmbobControllerTest < ActionController::TestCase
  test "should get display" do
    get :display
    assert_response :success
  end

end
