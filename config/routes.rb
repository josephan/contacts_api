Rails.application.routes.draw do
  resources :contacts, only: [:index, :create, :update, :destroy]
end