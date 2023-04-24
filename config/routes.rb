Rails.application.routes.draw do
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Define the root path routes
  root "items#index"
  resources :items
end
