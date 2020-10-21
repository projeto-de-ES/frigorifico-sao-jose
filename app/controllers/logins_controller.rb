class LoginsController < ApplicationController

  def index
    @mensagens = []
  end

  def create
    login = params[:login]
    senha = params[:senha]

    usuario_logado = buscarLogin(login,senha)

    if usuario_logado.nil?
      redirect_to logins_path, notice: "Login ou senha não encontrado."
    else
      Usuario.set_usuario(usuario_logado)
      redirect_to root_path, notice: "Usuário logado com sucesso!"
    end

  end

  def buscarLogin(login,senha)
    todos_usuarios = Usuario.all
    usuario_logado = nil

    todos_usuarios.each do |usuario|
      if usuario.login == login && usuario.senha == senha
        usuario_logado = usuario
      end
    end
    usuario_logado
  end

  def destroy
    Usuario.set_usuario(nil)
    redirect_to root_path
  end
end
