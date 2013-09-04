require 'test_helper'

class CursadasControllerTest < ActionController::TestCase
  setup do
    @cursada = cursadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cursada" do
    assert_difference('Cursada.count') do
      post :create, cursada: {  }
    end

    assert_redirected_to cursada_path(assigns(:cursada))
  end

  test "should show cursada" do
    get :show, id: @cursada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cursada
    assert_response :success
  end

  test "should update cursada" do
    patch :update, id: @cursada, cursada: {  }
    assert_redirected_to cursada_path(assigns(:cursada))
  end

  test "should destroy cursada" do
    assert_difference('Cursada.count', -1) do
      delete :destroy, id: @cursada
    end

    assert_redirected_to cursadas_path
  end
end
