require 'sidekiq/web'

Memoriae::Application.routes.draw do
  resources :articles do
    resources :notes
  end
  post '/mark_all_articles_as_read' => 'articles#mark_all_as_read'

  devise_for :users

  user_logged_in_constraint = lambda { |request| request.env['warden'].authenticate!({ scope: :user }) }
  constraints user_logged_in_constraint do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :pages, only: [:show] do
    collection do
      get :tools
    end
  end

  root to: 'pages#home'
end
