Rails.application.routes.draw do
  root 'homes#index'
  
  get 'homes/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "users/show" => 'users#show'
  get 'reservations/index'
  post 'rooms/:id' => 'rooms#show'


  resources :rooms do
    resources :reservations
  end

  post 'rooms/:room_id/reservations' => 'reservations#create'
  get 'rooms/:room_id/reservations/:id/edit' => 'reservations#edit'
  delete 'rooms' => 'rooms#destroy'
  resources :users

end
