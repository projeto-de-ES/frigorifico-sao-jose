class LoginsController < ApplicationController

  def index
  end

  def create
    login = params[:login]
    senha = params[:senha]

    aux = buscarLogin(login,senha)

    if aux.nil?
      redirect_to logins_path
    else
      Usuario.set_usuario(aux)
      redirect_to root_path
    end

  end

  def buscarLogin(login,senha)
    busca = Usuario.all
    aux = nil

    busca.each do |b|
      if b.login == login && b.senha == senha
        aux = b
      end
    end
    aux
  end

  def destroy
    Usuario.set_usuario(nil)
    redirect_to root_path
  end
end
