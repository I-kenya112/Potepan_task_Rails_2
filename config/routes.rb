Rails.application.routes.draw do
  root 'homes#index'
  
  get 'homes/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "users/show" => 'users#show'
  get 'reservations/index'
  # post 'rooms/:id' => 'rooms#show'

  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users
end
