Rails.application.routes.draw do
  resources :fields, only: [:index, :show]
  resources :crops, only: [:index]
end
