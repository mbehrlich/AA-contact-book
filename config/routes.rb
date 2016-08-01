Rails.application.routes.draw do

  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/new', to: 'users#new'
  get 'users/edit', to: 'users#edit'
  post 'users/', to: 'users#create'
  put 'users/:id', to: 'users#update'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  # resources :users
end
