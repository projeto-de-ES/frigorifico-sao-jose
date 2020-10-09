require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "deve salvar produto com nome, categoria, quantidade em estoque e preço" do
    usuario = Usuario.new nome: "victor", login: "victor@gmailcom", senha: "11111111"
    usuario.save
    produto = Produto.new nome: "carne", categoria: "boi", qtd_estoque: 12.2, preco: 10.0
    assert produto.save
  end

  test "nao deve salvar produto sem nome" do
    usuario = Usuario.new nome: "Thais", login: "Thais@gmailcom", senha: "22222222"
    usuario.save
    produto = Produto.new nome: "", categoria: "boi", qtd_estoque: 12.2, preco: 10.0
    assert_not produto.save
  end

  test "deve deletar um produto" do
    usuario = Usuario.new nome: "Thais", login: "Thais@gmailcom", senha: "22222222"
    usuario.save
    produto = Produto.new nome: "", categoria: "boi", qtd_estoque: 12.2, preco: 10.0
    produto.save
    assert produto.destroy
  end
end
