Rails.application.routes.draw do
 
  devise_for :users
   get '/login', to: 'sessions#new'
   post '/sessions', to: 'sessions#create'
   delete '/sessions', to: 'sessions#destroy'

 	resources :users, only: [:new, :index, :create] do 
	 	member do 
	 	post "/follow", to: "users#follow"
	 	post "/unfollow", to: "users#unfollow"
	end
  end
 	resources :chirps
 	get "/profile", to: "users#profile"
    get "/profile/:username", to: "users#show", as: "profile_user"

#  	get "/users", to: "users#index"
#  	post "/users", to: "users#create"
#   	get "/users/new", to: "users#new", as: "new_user"
#  	get "/users/:id", to: "users#show", as: "user"
#  	get "/users/:id/edit", to: "users#edit", as: "edit_user"
#  	put "/users/:id", to: "users#update"
#  	patch "/users/:id", to: "users#update"
#  	delete "/users/:id", to: "users#destroy"
 
 	# You can have the root of your site routed with "root"
 	root "chirps#index"

 end
 
