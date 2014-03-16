Hemdenpilot::Application.routes.draw do

  get "about_shirts/labels"
  get "about_shirts/ties"
  get "about_shirts/washing"
  get "about_shirts/buttons"
  get "about_shirts/folding"
  get "about_shirts/trends"
  get "about_shirts/good_to_know"
  resources :shirts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'shirts#index'


	get '/home', to: 'shirts#index'
	get '/search', to: 'shirts#search'
	get '/kontakt', to: 'shirts#kontakt'
	get '/new', to: 'shirts#new'
	get '/show', to: 'shirts#show'
  get '/edit', to: 'shirts#edit'



  get '/signin',  to: 'sessions#new'
  get '/sessions', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'



  get '/impressum', to: 'contacts#impressum'
  get '/contact', to: 'contacts#contact'
  get "contacts/aboutus"
  get "contacts/blog"
  get "contacts/jobs"
  get "contacts/affiliate"
  get "contacts/faq"



end
