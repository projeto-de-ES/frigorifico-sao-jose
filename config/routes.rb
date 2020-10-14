Rails.application.routes.draw do
  resources :produto_vendas
  resources :vendas
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
