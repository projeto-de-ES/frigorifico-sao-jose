class Usuario < ApplicationRecord
  validates :login, presence: {message: "campo deve ser preenchido!"}, uniqueness: {message: "valor do campo já existe!"}, length: {minimum: 6,message: "Minimo de 6 caracteres não atingido"}
  validates :nome, presence:{message: "campo deve ser preenchido"}, length: {minimum: 4, message: "Minimo de 4 caracteres não atingido"}
  validates :senha, presence: {message: "campo deve ser preenchido"}, length: {minimum: 8, message: "Minimo de 8 caracteres não atingido"}

  has_one :caixa
private
@is_logado = false

private
@logado = nil

def self.get_usuario
  @logado
end

def self.set_usuario(usuario)
  @logado = usuario
  if @logado.nil?
    @is_logado = false
  else
    @is_logado = true
  end
end

def self.checar_usuario_logado
  @is_logado
end
end