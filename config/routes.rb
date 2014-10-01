Chatter::Application.routes.draw do
  root to: 'users#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :statuses, only: [:new, :create]
  resources :users, only: [:new, :create]

  get '/:username', to: 'users#show', as: 'user'
end
