Memoriae::Application.routes.draw do
  resources :pages

  devise_for :users
  root to: 'pages#home'
end
