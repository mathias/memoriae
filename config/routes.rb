Memoriae::Application.routes.draw do
  resources :articles

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
end
