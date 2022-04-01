Rails.application.routes.draw do
  get 'rooms/index'
  resources :comments
  resources :rooms
    devise_for :users , controllers:{
        #sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    
root to: 'tops#index'
    #devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new'
    resources :users, only: [:show, :edit, :update, :profile, :profile_update]
    get "users/show" => "users#show"
    get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
    get 'rooms/new' , to: 'rooms#new'
  end
