Rails.application.routes.draw do
  
  resources :articles

  root 'page#home'
  
  get '/about',to: 'page#about'

  get 'signup', to: 'users#new'
 
 resources :users, except:[:new]

  end
