require 'test_helper'

class ShirtsControllerTest < ActionController::TestCase
  setup do
    @shirt = shirts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shirts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shirt" do
    assert_difference('Shirt.count') do
      post :create, shirt: { affiliate: @shirt.affiliate, breast_pocket: @shirt.breast_pocket, cloth: @shirt.cloth, code: @shirt.code, collar: @shirt.collar, color: @shirt.color, description: @shirt.description, ean: @shirt.ean, label: @shirt.label, link: @shirt.link, picture: @shirt.picture, price: @shirt.price, profile: @shirt.profile, size_arm: @shirt.size_arm, size_back: @shirt.size_back, size_body: @shirt.size_body, size_bust: @shirt.size_bust, size_collar: @shirt.size_collar, size_shoulder: @shirt.size_shoulder, size_waist: @shirt.size_waist, size_wrist: @shirt.size_wrist, sleeve: @shirt.sleeve, wristband: @shirt.wristband }
    end

    assert_redirected_to shirt_path(assigns(:shirt))
  end

  test "should show shirt" do
    get :show, id: @shirt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shirt
    assert_response :success
  end

  test "should update shirt" do
    patch :update, id: @shirt, shirt: { affiliate: @shirt.affiliate, breast_pocket: @shirt.breast_pocket, cloth: @shirt.cloth, code: @shirt.code, collar: @shirt.collar, color: @shirt.color, description: @shirt.description, ean: @shirt.ean, label: @shirt.label, link: @shirt.link, picture: @shirt.picture, price: @shirt.price, profile: @shirt.profile, size_arm: @shirt.size_arm, size_back: @shirt.size_back, size_body: @shirt.size_body, size_bust: @shirt.size_bust, size_collar: @shirt.size_collar, size_shoulder: @shirt.size_shoulder, size_waist: @shirt.size_waist, size_wrist: @shirt.size_wrist, sleeve: @shirt.sleeve, wristband: @shirt.wristband }
    assert_redirected_to shirt_path(assigns(:shirt))
  end

  test "should destroy shirt" do
    assert_difference('Shirt.count', -1) do
      delete :destroy, id: @shirt
    end

    assert_redirected_to shirts_path
  end
end
