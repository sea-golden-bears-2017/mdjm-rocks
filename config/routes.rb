Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parts, only: [:index]
  resources :warehouses, only: [:find] do
    resources :parts, only: [:index]
  end
end
