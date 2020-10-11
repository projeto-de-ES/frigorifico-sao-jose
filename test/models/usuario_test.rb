require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  test "Nao pode cadastrar usuario com um ou mais campos vazios" do
    usuario = Usuario.new
    assert_not usuario.save
  end
  test "Pode cadastrar usuario com todos os campos preenchidos" do
    usuario = Usuario.new nome:'josefa melo', login: 'Josefa', senha:'josefa123'
    assert usuario.save
  end
  test "Nao pode cadastrar usuario com login com menos de 6 caracteres" do
    usuario = Usuario.new nome:'josefa melo', login: 'Jose', senha:'josefa123'
    assert_not usuario.save
  end
end
