require 'test_helper'

class CaixaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "deve abrir o caixa com o valor inicial" do
    usuario = Usuario.new nome: "carlos", login: "carlos@gmailcom", senha: "11111111"
    usuario.save
    caixa = Caixa.new valor_inicial: 200.0, valor_total: 200.0, valor_arrecadado: 0.0, aberto: true, data: "2020-10-17", usuario_id: usuario.id
    assert caixa.save
  end

  test "nao deve abrir o caixa sem valor inicial" do
    usuario = Usuario.new nome: "carlos", login: "carlos@gmailcom", senha: "11111111"
    usuario.save
    caixa = Caixa.new valor_inicial: nil, valor_total: 200.0, valor_arrecadado: 0.0, aberto: true, data: "2020-10-17", usuario_id: usuario.id
    assert_not caixa.save
  end

  test "deve fechar o caixa" do
    usuario = Usuario.new nome: "carlos", login: "carlos@gmailcom", senha: "11111111"
    usuario.save
    caixa = Caixa.new valor_inicial: 200.0, valor_total: 200.0, valor_arrecadado: 0.0, aberto: true, data: "2020-10-17", usuario_id: usuario.id
    caixa.save
    caixa.aberto = false
    assert caixa.update
  end
end
