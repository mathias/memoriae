Memoriae::Application.routes.draw do
  resources :articles do
    resources :notes
  end

  devise_for :users

  root to: 'pages#home'
end
