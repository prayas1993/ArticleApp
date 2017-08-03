Rails.application.routes.draw do
 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :articles do
     resources :comments
  end 
  post '/articles/:id/activate' , to:'articles#active', as: "activate_article"
  
  get '/pricefilter' , to:'articles#pricefilter', as: "pricefilter"
  
  get '/applypricefilter' , to:'articles#apply_price_filter' ,as:"applypricefilter"

  root 'page#home'
  
  get '/about',to: 'page#about'

  get 'signup', to: 'users#new'

  
  
 resources :users, except:[:new]

  end
