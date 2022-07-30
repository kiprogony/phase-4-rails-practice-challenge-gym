Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gyms, only: [:show, :index, :update, :destroy]
  resources :clients, only: [:index, :show, :update]
  resources :memberships, only: [:create]
end
