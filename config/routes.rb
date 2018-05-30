Rails.application.routes.draw do
  resources :departments
  root "dashboard#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: :log_in
  delete '/logout', to: 'sessions#destroy', as: :log_out

  resources :shoppings
  resources :meals
  resources :staffs do
    member do
      get :add_admin
      get :remove_admin
    end
  end
  scope 'profile' do
    controller :profile do
      get :password
      put :update_password
    end
  end
end
