Rails.application.routes.draw do
	
	root 'boats#index'

	get '/boats/my_boats', to: 'boats#my_boats', as: 'my_boats'
  resources :boats
  get '/boats/:id/delete', to: 'boats#delete', as: 'delete_boat'
  get '/boats/:id/destroy', to: 'boats#destroy', as: 'destroy_boat'
  get '/boats/:id/add_as_favorite', to: 'boats#add_as_favorite', as: 'add_as_favorite'

  resources :users

  get '/login', to: 'access#login', as: 'login'
  get '/logout', to: 'access#logout', as: 'logout'

  match ':controller(/:action)(/:id)', :via => [:get, :post]

  #resources :access

end
