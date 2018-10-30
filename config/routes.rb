Rails.application.routes.draw do
  
  root 'articles#index'
  get 'welcome/index'
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'users', to: 'users#index'
  patch '/users/:id', to: 'users#update', as: 'user_update'
  get '/confluence', to: 'confluences#index'
  get '/confluence/space', to: 'confluences#getspacelist'
  get 'confluence/children', to: 'confluences#getspacechildren'
	
	resources :articles do
    resources :comments
  end

  resources :categories do
  end

	get 'categories/:category_id/articles', to: 'articles#showcategoryarticles', as: 'show_all'
  get 'blog/new', to: 'blog#new'
	post 'blog/new', to: 'blog#create'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
