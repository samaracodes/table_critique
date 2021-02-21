Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#destroy'

  root "sessions#home"

  
  resources :reviews
  resources :users do 
    resources :reviews, only: [:new, :create, :index]
  end
  resources :restaurants do
    resources :reviews, only: [:index, :show]
  end
  resources :categories do
    resources :restaurants, only: [:index]
  end
  resources :restaurants, only: [:index, :show]

  #NESTED ROUTES
    # purpose of nested routes is so we can find
    #users/:id/reviews

    # new, show, or index

    #'/users'

    #'/users/:id/reviews'

    #'/reviews'

    #'/restaurants'

    #'/restaurants/:id/reviews'

  

end
