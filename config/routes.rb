Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #omniauth callback route
  get '/auth/:provider/callback' => 'sessions#github'

  #logout route
  delete '/logout' => 'sessions#destroy'

  
  

  root "sessions#home"

  
  resources :reviews
  resources :users
  resources :categories

  resources :restaurants do
    resources :reviews
  end
  

  resources :categories do 
    resources :reviews
  end
  
  resources :restaurants, only: [:index, :show]
  

end
