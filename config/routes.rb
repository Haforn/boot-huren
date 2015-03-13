Rails.application.routes.draw do
	
	root 'boats#index'

  resources :boats 
  get '/boats/:id/delete', to: 'boats#delete', as: 'delete_boat'
  get '/boats/:id/destroy', to: 'boats#destroy', as: 'destroy_boat'

  resources :users

  get '/login', to: 'access#login', as: 'login'

  match ':controller(/:action)(/:id)', :via => [:get, :post]

  #resources :access

end
