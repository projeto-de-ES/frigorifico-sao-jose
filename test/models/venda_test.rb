require 'test_helper'

class VendaTest < ActiveSupport::TestCase
  test "Nao pode cadastrar venda com um ou mais campos vazios" do
    venda = Venda.new
    assert_not venda.save
  end

  test "Pode cadastrar venda com todos os campos preenchidos" do
    produto = Produto.new nome: 'carne moida', categoria:'boi', qtd_estoque:'6', preco: '35.00'
    produto.save
    produto_venda = ProdutoVenda.new produto_id: produto.id, qtd_produtos: '1'
    produto_venda.save
    venda = Venda.new valor: '35.00'
    assert venda.save
  end
  test "Nao pode cadastrar venda com campo valor da venda nao preenchido" do
    produto = Produto.new nome: 'carne moida', categoria:'boi', qtd_estoque:'6', preco: '35.00'
    produto.save
    produto_venda = ProdutoVenda.new produto_id: produto.id, qtd_produtos: '1'
    produto_venda.save
    venda = Venda.new
    assert_not venda.save
  end
end
