Rails.application.routes.draw do
  resources :travels
  resources :vehicles
  resources :recharges
  resources :cards
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
