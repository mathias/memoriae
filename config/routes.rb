require 'sidekiq/web'

Memoriae::Application.routes.draw do
  resources :articles do
    resources :notes
  end

  devise_for :users

  user_logged_in_constraint = lambda { |request| request.env['warden'].authenticate!({ scope: :user }) }
  constraints user_logged_in_constraint do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'
end
