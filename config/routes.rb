Rails.application.routes.draw do
  resources :usuarios do 
    member do 
      get   'caixa/abrir'
      post  'caixa/abrir', to: "caixa#abrirCaixa"
      get   'caixa/fechar'
      post  'caixa/fechar', to: "caixa#fecharCaixa"
    end
  end
  resources :vendas do
    resources :produto_vendas
    member do
      get :finalizarVenda
    end
  end
  resources :usuarios
  resources :logins
  get 'logins/index'
  get 'logins/destroy'
  resources :produtos do
    member do
      get :recebimento
      post :recebimento, to: "produtos#recebimentoAtualiza"
    end
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
