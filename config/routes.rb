Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :bands, only: [:index, :show, :new, :create] do
    resources :jam_sessions, only: [:create]
  end

  resources :jam_sessions, only: [:destroy]
  resources :user, only: [:show]
end
