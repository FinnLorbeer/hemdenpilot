Hemdenpilot::Application.routes.draw do
  resources :shirts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'shirts#index'

	get '/home', to: 'shirts#index'
	get '/search', to: 'shirts#search'
	get '/kontakt', to: 'shirts#kontakt'
	get '/impressum', to: 'shirts#impressum'
	get '/new', to: 'shirts#new'
	get '/show', to: 'shirts#show'
  get '/edit', to: 'shirts#edit'
  get '/signin',  to: 'sessions#new'
  get '/sessions', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  
  
end
