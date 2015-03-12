Rails.application.routes.draw do
  
  resources :boats 
  get '/boats/:id/delete', to: 'boats#delete', as: 'delete_boat'
  get '/boats/:id/destroy', to: 'boats#destroy', as: 'destroy_boat'

  resources :user_profiles
end
