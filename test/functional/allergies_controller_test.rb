require 'test_helper'

class AllergiesControllerTest < ActionController::TestCase
  setup do
    @allergy = allergies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allergies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allergy" do
    assert_difference('Allergy.count') do
      post :create, allergy: { desc: @allergy.desc, ingredient_id: @allergy.ingredient_id }
    end

    assert_redirected_to allergy_path(assigns(:allergy))
  end

  test "should show allergy" do
    get :show, id: @allergy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allergy
    assert_response :success
  end

  test "should update allergy" do
    put :update, id: @allergy, allergy: { desc: @allergy.desc, ingredient_id: @allergy.ingredient_id }
    assert_redirected_to allergy_path(assigns(:allergy))
  end

  test "should destroy allergy" do
    assert_difference('Allergy.count', -1) do
      delete :destroy, id: @allergy
    end

    assert_redirected_to allergies_path
  end
end
