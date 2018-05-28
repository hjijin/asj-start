Rails.application.routes.draw do
  root "dashboard#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: :log_in
  delete '/logout', to: 'sessions#destroy', as: :log_out

  resources :shoppings
  resources :meals
  resources :staffs
  scope 'profile' do
    controller :profile do
      get :password
      put :update_password
    end
  end
end
