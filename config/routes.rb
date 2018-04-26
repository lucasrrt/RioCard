Rails.application.routes.draw do
	get 'simulator/index'
	get 'simulator/travel'
	get 'simulator/', to: 'simulator#index'

	root 'welcome#index'

	get 'welcome/index'

	resources :travels
	resources :vehicles
	resources :recharges
	resources :cards
	resources :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
