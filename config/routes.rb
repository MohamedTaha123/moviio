Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :movies, only: [:index]
    resources :seasons, only: [:index]
    resources :users, only: [] do
      resources :seasons do
        resources :purchases, only: [:create], module: :seasons
      end
      resources :movies do
        resources :purchases, only: [:create], module: :movies
      end
    end
    get '/users/:user_id/mylibrary' => 'users#own_library', as: :user_library
  end
end
