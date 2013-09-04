require 'test_helper'

class ValidasControllerTest < ActionController::TestCase
  setup do
    @valida = validas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:validas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valida" do
    assert_difference('Valida.count') do
      post :create, valida: {  }
    end

    assert_redirected_to valida_path(assigns(:valida))
  end

  test "should show valida" do
    get :show, id: @valida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valida
    assert_response :success
  end

  test "should update valida" do
    patch :update, id: @valida, valida: {  }
    assert_redirected_to valida_path(assigns(:valida))
  end

  test "should destroy valida" do
    assert_difference('Valida.count', -1) do
      delete :destroy, id: @valida
    end

    assert_redirected_to validas_path
  end
end
