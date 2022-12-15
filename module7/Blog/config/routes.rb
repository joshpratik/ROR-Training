Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :posts
  end

  root to: 'posts#index'
  get 'signup', to: 'users#new', as: 'signup'
  post 'register', to: 'users#create', as: 'register'
  get 'addpost/:id', to: 'posts#new'
  get 'editpost/:id', to: 'posts#edit'
  get 'edituser/:id', to: 'users#edit'
end
