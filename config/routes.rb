Rails.application.routes.draw do
  resources :courses
  root 'pages#index'
  get 'pages/index'
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
end
