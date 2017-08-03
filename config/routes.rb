Rails.application.routes.draw do
 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :articles

  root 'page#home'
  
  get '/about',to: 'page#about'

  get 'signup', to: 'users#new'
 
 resources :users, except:[:new]

  end
