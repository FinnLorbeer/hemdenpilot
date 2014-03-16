require 'test_helper'

class AboutShirtsControllerTest < ActionController::TestCase
  test "should get labels" do
    get :labels
    assert_response :success
  end

  test "should get ties" do
    get :ties
    assert_response :success
  end

  test "should get washing" do
    get :washing
    assert_response :success
  end

  test "should get buttons" do
    get :buttons
    assert_response :success
  end

  test "should get folding" do
    get :folding
    assert_response :success
  end

  test "should get trends" do
    get :trends
    assert_response :success
  end

  test "should get good_to_know" do
    get :good_to_know
    assert_response :success
  end

end
