Rails.application.routes.draw do
  resources :subfeds
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/destroy' => 'sessions#destroy'

  #delete '/subfeds/:id', to: 'subfeds#destroy', as: 'subfed'

  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :subfeds, only: [:index, :new, :create, :edit, :update, :show, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
