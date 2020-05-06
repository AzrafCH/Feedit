Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/destroy' => 'sessions#destroy'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/login')

  #delete '/subfeds/:id', to: 'subfeds#destroy', as: 'subfed'

  resources :users, only: [:index, :new, :create, :edit, :update] do
    patch 'users/:id', to: 'users#update'
    resources :comments, only: [:index]
  end

  resources :comments

  resources :subfeds, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  patch 'subfeds/:id', to: 'subfeds#update'

  resources :posts, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
  patch 'posts/:id', to: 'posts#update'
    resources :comments
end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
