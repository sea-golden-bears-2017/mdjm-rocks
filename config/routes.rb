Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :parts, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :warehouses, only: [:find] do
    resources :parts, only: [:index]
  end
end
