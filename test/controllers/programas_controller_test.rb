require 'test_helper'

class ProgramasControllerTest < ActionController::TestCase
  setup do
    @programa = programas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create programa" do
    assert_difference('Programa.count') do
      post :create, programa: { duracion: @programa.duracion, es_maestria: @programa.es_maestria, nombre: @programa.nombre }
    end

    assert_redirected_to programa_path(assigns(:programa))
  end

  test "should show programa" do
    get :show, id: @programa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @programa
    assert_response :success
  end

  test "should update programa" do
    patch :update, id: @programa, programa: { duracion: @programa.duracion, es_maestria: @programa.es_maestria, nombre: @programa.nombre }
    assert_redirected_to programa_path(assigns(:programa))
  end

  test "should destroy programa" do
    assert_difference('Programa.count', -1) do
      delete :destroy, id: @programa
    end

    assert_redirected_to programas_path
  end
end
