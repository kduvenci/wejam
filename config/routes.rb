Rails.application.routes.draw do
  root to: 'pages#home'
  resources :bands, only: [:show_all]
  resources :user, only: [:show, :new, :create] do
    get "/dashboard", to: 'pages#dashboard', as: 'dashboard'
    resources :bands, only: [:index, :show, :new, :create]
  end
end
