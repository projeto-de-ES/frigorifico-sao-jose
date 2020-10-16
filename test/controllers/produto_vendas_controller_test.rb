require 'test_helper'

class ProdutoVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto_venda = produto_vendas(:one)
  end

  test "should get index" do
    get produto_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_venda_url
    assert_response :success
  end

  test "should create produto_venda" do
    assert_difference('ProdutoVenda.count') do
      post produto_vendas_url, params: { produto_venda: { produto_id: @produto_venda.produto_id, qtd_produtos: @produto_venda.qtd_produtos, valor: @produto_venda.valor, venda_id: @produto_venda.venda_id } }
    end

    assert_redirected_to produto_venda_url(ProdutoVenda.last)
  end

  test "should show produto_venda" do
    get produto_venda_url(@produto_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_venda_url(@produto_venda)
    assert_response :success
  end

  test "should update produto_venda" do
    patch produto_venda_url(@produto_venda), params: { produto_venda: { produto_id: @produto_venda.produto_id, qtd_produtos: @produto_venda.qtd_produtos, valor: @produto_venda.valor, venda_id: @produto_venda.venda_id } }
    assert_redirected_to produto_venda_url(@produto_venda)
  end

  test "should destroy produto_venda" do
    assert_difference('ProdutoVenda.count', -1) do
      delete produto_venda_url(@produto_venda)
    end

    assert_redirected_to produto_vendas_url
  end
end
