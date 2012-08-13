require 'test_helper'

class AteliersControllerTest < ActionController::TestCase
  setup do
    @atelier = ateliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ateliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atelier" do
    assert_difference('Atelier.count') do
      post :create, atelier: { stage_id: @atelier.stage_id, title: @atelier.title }
    end

    assert_redirected_to atelier_path(assigns(:atelier))
  end

  test "should show atelier" do
    get :show, id: @atelier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atelier
    assert_response :success
  end

  test "should update atelier" do
    put :update, id: @atelier, atelier: { stage_id: @atelier.stage_id, title: @atelier.title }
    assert_redirected_to atelier_path(assigns(:atelier))
  end

  test "should destroy atelier" do
    assert_difference('Atelier.count', -1) do
      delete :destroy, id: @atelier
    end

    assert_redirected_to ateliers_path
  end
end
