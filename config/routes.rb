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
  get '/logout' => 'sessions#destroy'
  

  root "sessions#home"

  
  resources :reviews


  resources :restaurants do
    resources :reviews, only: [:new, :show, :index]
  end

  resources :users, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :show]
  end

  resources :categories, only: [:index, :show] do 
    resources :reviews, only: [:index, :show]
  end
  

end
