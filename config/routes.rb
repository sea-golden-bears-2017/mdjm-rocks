Rails.application.routes.draw do
  root to: "sessions#new"
  resources :sessions, only: [:new, :create]
  delete "/sessions", to: 'sessions#destroy'
  resources :parts, only: [:index]
  resources :warehouses, only: [:find] do
    resources :parts, only: [:index]
  end
end
