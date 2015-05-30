require 'test_helper'

class FoodResponcesControllerTest < ActionController::TestCase
  setup do
    @food_responce = food_responces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_responces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_responce" do
    assert_difference('FoodResponce.count') do
      post :create, food_responce: { food_donor_id: @food_responce.food_donor_id, has_transport: @food_responce.has_transport, ngo_id: @food_responce.ngo_id, status: @food_responce.status }
    end

    assert_redirected_to food_responce_path(assigns(:food_responce))
  end

  test "should show food_responce" do
    get :show, id: @food_responce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_responce
    assert_response :success
  end

  test "should update food_responce" do
    patch :update, id: @food_responce, food_responce: { food_donor_id: @food_responce.food_donor_id, has_transport: @food_responce.has_transport, ngo_id: @food_responce.ngo_id, status: @food_responce.status }
    assert_redirected_to food_responce_path(assigns(:food_responce))
  end

  test "should destroy food_responce" do
    assert_difference('FoodResponce.count', -1) do
      delete :destroy, id: @food_responce
    end

    assert_redirected_to food_responces_path
  end
end
