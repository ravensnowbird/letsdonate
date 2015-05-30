require 'test_helper'

class NotifiersControllerTest < ActionController::TestCase
  setup do
    @notifier = notifiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notifier" do
    assert_difference('Notifier.count') do
      post :create, notifier: { email: @notifier.email, name: @notifier.name, ngo_id: @notifier.ngo_id, phone: @notifier.phone }
    end

    assert_redirected_to notifier_path(assigns(:notifier))
  end

  test "should show notifier" do
    get :show, id: @notifier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notifier
    assert_response :success
  end

  test "should update notifier" do
    patch :update, id: @notifier, notifier: { email: @notifier.email, name: @notifier.name, ngo_id: @notifier.ngo_id, phone: @notifier.phone }
    assert_redirected_to notifier_path(assigns(:notifier))
  end

  test "should destroy notifier" do
    assert_difference('Notifier.count', -1) do
      delete :destroy, id: @notifier
    end

    assert_redirected_to notifiers_path
  end
end
