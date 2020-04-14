Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/destroy' => 'sessions#destroy'

  #delete '/subfeds/:id', to: 'subfeds#destroy', as: 'subfed'

  resources :users, only: [:index, :new, :create, :edit, :update]
  patch 'users/:id', to: 'users#update'

  resources :subfeds, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  patch 'subfeds/:id', to: 'subfeds#update'

  resources :posts, only: [:index, :new, :create, :edit, :show, :update, :destroy]
  patch 'posts/:id', to: 'posts#update'

  resources :comments, only: [:create, :destroy, :edit, :update]
  patch 'comments/:id', to: 'comments#update'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
