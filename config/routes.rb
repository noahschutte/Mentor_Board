Rails.application.routes.draw do
  root 'index#index'

  resources :users
  resources :sessions, only: [:destroy, :new, :create]
  get "login" => 'sessions#new', :as => "login"
  get "logout" => 'sessions#destroy', :as => "logout"
  resources :appointments, only: [:new, :show, :index, :create] do
    resources :reviews, only: [:create]
  end
  patch "appointments/:id" => 'appointments#update', :as => "update_appointment"
end

