Shoppy::Application.routes.draw do

	resources :products
	resources :categories
	resources :users
	resources :sessions, :only => [:new, :create, :destroy]
	
	match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => "sessions#new"

end
