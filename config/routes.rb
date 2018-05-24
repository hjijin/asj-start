Rails.application.routes.draw do
  resources :shoppings
  root "dashboard#index"

  resources :staffs

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: :log_in
  delete '/logout', to: 'sessions#destroy', as: :log_out
end
