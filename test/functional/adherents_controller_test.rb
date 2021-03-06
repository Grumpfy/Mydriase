require 'test_helper'

class AdherentsControllerTest < ActionController::TestCase
  setup do
    @adherent = adherents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adherents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adherent" do
    assert_difference('Adherent.count') do
      post :create, adherent: { adresse: @adherent.adresse, code_postal: @adherent.code_postal, mail: @adherent.mail, nom: @adherent.nom, portable: @adherent.portable, prenom: @adherent.prenom, remarques: @adherent.remarques, tel: @adherent.tel, ville: @adherent.ville }
    end

    assert_redirected_to adherent_path(assigns(:adherent))
  end

  test "should show adherent" do
    get :show, id: @adherent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adherent
    assert_response :success
  end

  test "should update adherent" do
    put :update, id: @adherent, adherent: { adresse: @adherent.adresse, code_postal: @adherent.code_postal, mail: @adherent.mail, nom: @adherent.nom, portable: @adherent.portable, prenom: @adherent.prenom, remarques: @adherent.remarques, tel: @adherent.tel, ville: @adherent.ville }
    assert_redirected_to adherent_path(assigns(:adherent))
  end

  test "should destroy adherent" do
    assert_difference('Adherent.count', -1) do
      delete :destroy, id: @adherent
    end

    assert_redirected_to adherents_path
  end
end
