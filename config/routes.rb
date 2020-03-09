Rails.application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/destroy' => 'session#destroy'

  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
