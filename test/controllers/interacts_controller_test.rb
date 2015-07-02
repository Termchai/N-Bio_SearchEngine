require 'test_helper'

class InteractsControllerTest < ActionController::TestCase
  setup do
    @interact = interacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interact" do
    assert_difference('Interact.count') do
      post :create, interact: { m1: @interact.m1, m2: @interact.m2, source: @interact.source }
    end

    assert_redirected_to interact_path(assigns(:interact))
  end

  test "should show interact" do
    get :show, id: @interact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interact
    assert_response :success
  end

  test "should update interact" do
    patch :update, id: @interact, interact: { m1: @interact.m1, m2: @interact.m2, source: @interact.source }
    assert_redirected_to interact_path(assigns(:interact))
  end

  test "should destroy interact" do
    assert_difference('Interact.count', -1) do
      delete :destroy, id: @interact
    end

    assert_redirected_to interacts_path
  end
end
