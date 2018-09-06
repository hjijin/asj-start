Rails.application.routes.draw do
  root "dashboard#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: :log_in
  delete '/logout', to: 'sessions#destroy', as: :log_out

  resources :shoppings, :meals
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

  resources :departments, :goods, :watch_bills
  resources :books do
    member do
      put :circulate
    end
  end
  get "search", to:  "books#search"

  resources :projects, :quotation_categories, :quotations
  resources :quotation_lists do
    get :update_line_item
    member do
      get :construction_file
    end
    resources :quotation_list_items, only: [:show, :create, :update, :destroy] do
      member do
        get :add_line_item
        get :remove_line_item
      end
    end
  end
end
