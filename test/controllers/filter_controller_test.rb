require 'test_helper'

class FilterControllerTest < ActionController::TestCase
  test "should get activated" do
    get :activated
    assert_response :success
  end

  test "should get deactivated" do
    get :deactivated
    assert_response :success
  end

  test "should get pricefilter" do
    get :pricefilter
    assert_response :success
  end

  test "should get apply_price_filter" do
    get :apply_price_filter
    assert_response :success
  end

end
