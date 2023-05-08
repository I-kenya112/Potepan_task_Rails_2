Rails.application.routes.draw do
  root 'homes#index'
  
  get 'homes/index'
  devise_for :users
  
  get "users/show" => 'users#show'
  get 'reservations/index'
  delete '/reservations/:id', to: 'reservations#destroy', as: 'delete_reservation'


  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users
end
