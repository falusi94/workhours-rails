Rails.application.routes.draw do
  get '/login', to: 'sessions#show', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/register', to: 'registration#new', as: :register

  resources :registration, only: [:create]
  resources :records
  resources :issues
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
