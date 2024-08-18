Rails.application.routes.draw do
  resources :products
  resources :invoices
  get 'pages/index'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  post '/upload', to: 'files#upload'
  get "up" => "rails/health#show", as: :rails_health_check
end
