Hemdenpilot::Application.routes.draw do
  resources :shirts

  root to: 'shirts#index'

	get '/home', to: 'shirts#index'
	get '/search', to: 'shirts#search'
	get '/kontakt', to: 'shirts#kontakt'
	get '/impressum', to: 'shirts#impressum'
	get '/new', to: 'shirts#new'
	get '/show', to: 'shirts#show'
  
  resources :users
  
  match '/signup',  to: 'users#new',            via: 'get'

end
