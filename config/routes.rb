Rails.application.routes.draw do
  root to: 'surfboards#index'
  get '/dashboard', to: 'users#dashboard'

  resources :surfboards, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :update do
    resources :reviews, only: [:new, :create]
  end
end
