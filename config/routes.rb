Rails.application.routes.draw do
  devise_for :users

  namespace :blog do
    resources :posts

    root 'posts#index'
  end

  match '/admin(/*other)', to: 'admin#index', via: :all

  mount API, at: '/api'

  mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  root to: 'blog/posts#index'
end
