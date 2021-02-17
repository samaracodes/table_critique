Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  get '/login', to: 'users#show'
  
  
  resource :reviews
  resource :users
  resource :categories
  

end
