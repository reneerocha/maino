Rails.application.routes.draw do
  get 'pages/index'
  devise_for :users
  root 'pages#index'
  get 'pages/index'  
  get "up" => "rails/health#show", as: :rails_health_check
end
