Rails.application.routes.draw do
  root 'homes#index'

  get 'homes/index'
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'reservations/index'
  delete '/reservations/:id', to: 'reservations#destroy', as: 'delete_reservation'

  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get 'profile'
      put 'profile', to: 'users#update_profile'
    end
  end
end