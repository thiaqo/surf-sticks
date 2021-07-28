Rails.application.routes.draw do
  devise_for :users
  
  root to: 'pages#home'

  get 'users/:id/dashboard', to: 'users#dashboard'
  resources :users, only: [] do
    resources :surfboards, only: [:new, :create]
  end

  resources :surfboards, only: [:index, :show, :edit, :update, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :update, :create] do
    resources :reviews, only: [:new, :create]
  end
end
