require 'test_helper'

class FoodDonorsControllerTest < ActionController::TestCase
  setup do
    @food_donor = food_donors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_donors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_donor" do
    assert_difference('FoodDonor.count') do
      post :create, food_donor: { available_till: @food_donor.available_till, has_transport: @food_donor.has_transport, sufficient_for: @food_donor.sufficient_for }
    end

    assert_redirected_to food_donor_path(assigns(:food_donor))
  end

  test "should show food_donor" do
    get :show, id: @food_donor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_donor
    assert_response :success
  end

  test "should update food_donor" do
    patch :update, id: @food_donor, food_donor: { available_till: @food_donor.available_till, has_transport: @food_donor.has_transport, sufficient_for: @food_donor.sufficient_for }
    assert_redirected_to food_donor_path(assigns(:food_donor))
  end

  test "should destroy food_donor" do
    assert_difference('FoodDonor.count', -1) do
      delete :destroy, id: @food_donor
    end

    assert_redirected_to food_donors_path
  end
end
