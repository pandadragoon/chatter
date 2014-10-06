Chatter::Application.routes.draw do
  root to: 'index#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/timeline', to: 'users#timeline'
  get '/mentions', to: 'users#mentions'

  resources :hashtags, only: [:show]
  resources :statuses, only: [:new, :create, :index, :show] do
    member do
      post 'share'
    end
  end
  resources :users, only: [:new, :create, :index] do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  get '/:username', to: 'users#show', as: 'user'
end
