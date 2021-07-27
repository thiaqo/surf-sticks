Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/update'
  get 'reviews/new'
  get 'surfboards/index'
  get 'surfboards/show'
  get 'surfboards/new'
  get 'surfboards/edit'
  devise_for :users
  
  root to: 'surfboards#index'
  get '/dashboard', to: 'users#dashboard'

  resources :surfboards, except: :destroy do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :update do
    resources :reviews, only: [:new, :create]
  end
end
