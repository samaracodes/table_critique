Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#home"
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get 'login' => 'sessions#create'
  post '/login' => 'sessions#new'

  #logout route
  delete '/logout' => 'sessions#destroy'

  
  
  resource :reviews
  resource :users
  resource :categories
  

end
