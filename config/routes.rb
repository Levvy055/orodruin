Rails.application.routes.draw do
  devise_for :users

  namespace :blog do
    resources :posts

    root 'posts#index'
  end

  mount API => '/api'

  mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  root to: 'blog/posts#index'
end
