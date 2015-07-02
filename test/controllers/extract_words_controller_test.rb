require 'test_helper'

class ExtractWordsControllerTest < ActionController::TestCase
  setup do
    @extract_word = extract_words(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extract_words)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extract_word" do
    assert_difference('ExtractWord.count') do
      post :create, extract_word: { word: @extract_word.word }
    end

    assert_redirected_to extract_word_path(assigns(:extract_word))
  end

  test "should show extract_word" do
    get :show, id: @extract_word
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extract_word
    assert_response :success
  end

  test "should update extract_word" do
    patch :update, id: @extract_word, extract_word: { word: @extract_word.word }
    assert_redirected_to extract_word_path(assigns(:extract_word))
  end

  test "should destroy extract_word" do
    assert_difference('ExtractWord.count', -1) do
      delete :destroy, id: @extract_word
    end

    assert_redirected_to extract_words_path
  end
end
