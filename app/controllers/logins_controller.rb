class LoginsController < ApplicationController

  def index
    @mensagens = []
  end

  def create
    login = params[:login]
    senha = params[:senha]

    aux = buscarLogin(login,senha)

    if aux.nil?
      mensagem = ["Login ou senha não encontrado."]
      @mensagens = mensagem
      redirect_to logins_path
    else
      Usuario.set_usuario(aux)
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
