Rails.application.routes.draw do
 

  get 'filter/activated'

  get 'filter/deactivated'

  get 'filter/pricefilter'

  get 'filter/apply_price_filter'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :articles do
     resources :comments
  end 

  post '/articles/:id/activate' , to:'articles#active', as: "activate_article"
  
  get '/pricefilter' , to:'filter#pricefilter', as: "pricefilter"
  
  get '/applypricefilter' , to:'filter#apply_price_filter' ,as:"applypricefilter"

  get '/activated' , to:'filter#activated' , as:"applyactivatedfilter"
  
  get '/deactivated' , to:'filter#deactivated' , as:"applydeactivatedfilter"

  root 'page#home'
  
  get '/about',to: 'page#about'

  get 'signup', to: 'users#new'

  
  
 resources :users, except:[:new]

  end
