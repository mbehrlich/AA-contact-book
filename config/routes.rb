Rails.application.routes.draw do

  resources :users  do
    resources :contacts, only: [:index, :create, :new, :edit, :update]
  end
  resources :contacts, only: [:destroy, :show]

  resources :contact_shares, only: [:create, :destroy]

end
