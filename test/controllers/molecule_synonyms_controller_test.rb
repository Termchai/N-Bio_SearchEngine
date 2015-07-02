require 'test_helper'

class MoleculeSynonymsControllerTest < ActionController::TestCase
  setup do
    @molecule_synonym = molecule_synonyms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:molecule_synonyms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create molecule_synonym" do
    assert_difference('MoleculeSynonym.count') do
      post :create, molecule_synonym: { molecule_id: @molecule_synonym.molecule_id, synonym: @molecule_synonym.synonym }
    end

    assert_redirected_to molecule_synonym_path(assigns(:molecule_synonym))
  end

  test "should show molecule_synonym" do
    get :show, id: @molecule_synonym
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @molecule_synonym
    assert_response :success
  end

  test "should update molecule_synonym" do
    patch :update, id: @molecule_synonym, molecule_synonym: { molecule_id: @molecule_synonym.molecule_id, synonym: @molecule_synonym.synonym }
    assert_redirected_to molecule_synonym_path(assigns(:molecule_synonym))
  end

  test "should destroy molecule_synonym" do
    assert_difference('MoleculeSynonym.count', -1) do
      delete :destroy, id: @molecule_synonym
    end

    assert_redirected_to molecule_synonyms_path
  end
end
