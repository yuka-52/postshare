Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  root to: 'tops#index'
  
  resources :rooms do
    collection do
      get 'search', to: 'rooms#search'
    end
  end
  resources :rooms
  
  
  
  devise_for :users , controllers:{
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  resources :users, only: [:show, :edit, :update, :profile, :profile_update]
  get 'users/sign_in', to: 'users/sessions#new'
  get "users/show", to: "users#show"
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  get 'rooms/new' , to: 'rooms#new'
  post 'reservations/confirm', to: 'reservations#confirm',  as: 'confirm'
  post 'reservations/back'
  resources :reservations, only: [:index, :create, :show]
  
end
