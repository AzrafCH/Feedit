Rails.application.routes.draw do
  resources :subfeds
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/destroy' => 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :subfeds, only: [:index, :new, :create, :edit, :update, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
