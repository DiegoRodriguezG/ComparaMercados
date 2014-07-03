require 'test_helper'

class SupermercadosControllerTest < ActionController::TestCase
  setup do
    @supermercado = supermercados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supermercados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supermercado" do
    assert_difference('Supermercado.count') do
      post :create, supermercado: { logo: @supermercado.logo, nombre: @supermercado.nombre }
    end

    assert_redirected_to supermercado_path(assigns(:supermercado))
  end

  test "should show supermercado" do
    get :show, id: @supermercado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supermercado
    assert_response :success
  end

  test "should update supermercado" do
    patch :update, id: @supermercado, supermercado: { logo: @supermercado.logo, nombre: @supermercado.nombre }
    assert_redirected_to supermercado_path(assigns(:supermercado))
  end

  test "should destroy supermercado" do
    assert_difference('Supermercado.count', -1) do
      delete :destroy, id: @supermercado
    end

    assert_redirected_to supermercados_path
  end
end
