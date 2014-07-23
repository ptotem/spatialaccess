require 'test_helper'

class PresesntationsControllerTest < ActionController::TestCase
  setup do
    @presesntation = presesntations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presesntations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presesntation" do
    assert_difference('Presesntation.count') do
      post :create, presesntation: { header: @presesntation.header }
    end

    assert_redirected_to presesntation_path(assigns(:presesntation))
  end

  test "should show presesntation" do
    get :show, id: @presesntation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presesntation
    assert_response :success
  end

  test "should update presesntation" do
    patch :update, id: @presesntation, presesntation: { header: @presesntation.header }
    assert_redirected_to presesntation_path(assigns(:presesntation))
  end

  test "should destroy presesntation" do
    assert_difference('Presesntation.count', -1) do
      delete :destroy, id: @presesntation
    end

    assert_redirected_to presesntations_path
  end
end
