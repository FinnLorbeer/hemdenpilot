require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should get impressum" do
    get :impressum
    assert_response :success
  end

  test "should get aboutus" do
    get :aboutus
    assert_response :success
  end

  test "should get blog" do
    get :blog
    assert_response :success
  end

  test "should get jobs" do
    get :jobs
    assert_response :success
  end

  test "should get affiliate" do
    get :affiliate
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
