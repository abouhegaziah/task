Rails.application.routes.draw do
  resources :blogs
  get 'greetings/hello'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'sessions#login'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :blogs, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :comments, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/new', to: 'users#new'
  get '/blog', to: 'blogs#new'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
