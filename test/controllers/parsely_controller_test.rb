require 'test_helper'

class ParselyControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

end
