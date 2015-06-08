Rails.application.routes.draw do
  devise_for :users

  namespace :blog do
    resources :posts

    root 'posts#index'
  end

  match '/admin(/*other)', to: 'admin#index', via: :all

  mount API, at: '/api'

  mount PgHero::Engine, at: 'pghero' if Rails.env.development?

  %w(404 422 500).each do |code|
    get code, to: 'error#show', code: code
  end

  root to: 'blog/posts#index'
end
