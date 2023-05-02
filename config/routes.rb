Rails.application.routes.draw do
  root 'homes#index'
  
  get 'homes/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "users/show" => "users#show"

  resources :rooms, except: [:edit] do
    resources :reservations, only: [:create]
  end
end
