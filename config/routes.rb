Rails.application.routes.draw do
  namespace :api do
    resources :users do
      collection { get 'me' }
    end

    namespace :blog do
      resources :posts
    end
  end

  namespace :blog do
    resources :posts

    root 'posts#index'
  end

  get '/login', to: 'users/sessions#new', as: 'login'
  post '/login', to: 'users/sessions#create'

  match '/admin(/*other)', to: 'admin#index', via: :all

  mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  %w(404 422 500).each do |code|
    get code, to: 'error#show', code: code
  end

  root to: 'blog/posts#index'
end
