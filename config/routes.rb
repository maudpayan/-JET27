Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jets do
    resources :bookings, only: [:new, :create]
  end
  resources :jets do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:show]
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  get '/confirmation', to: 'pages#confirmation', as: :confirmation
  patch '/confirm', to: 'bookings#confirm', as: :confirm
end
