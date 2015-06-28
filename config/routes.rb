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

  get '/signin', to: 'users/sessions#new', as: 'signin'
  post '/signin', to: 'users/sessions#create'
  delete '/signout', to: 'users/sessions#destroy', as: 'signout'

  resources :users do
    member { get 'activate', as: 'activation' }
  end

  scope '/admin' do
    match '(/*other)', to: 'admin#index', via: :all

    mount PgHero::Engine, at: 'pghero' if Rails.env.development?
  end

  %w(404 422 500).each do |code|
    get code, to: 'error#show', code: code
  end

  root to: 'blog/posts#index'
end
