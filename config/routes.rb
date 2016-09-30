Rails.application.routes.draw do
  root 'static_pages#home'
  get  'static_pages/home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :microposts do
    resources :comments
  end
  resources :users do
  	member do
  	  get :following, :followers
  	end
  end
  resources :microposts,      only: [:create, :destroy]
  resources :relationships,   only: [:create, :destroy]

end
