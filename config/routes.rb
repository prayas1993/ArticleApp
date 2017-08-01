Rails.application.routes.draw do
  
  get 'articles/new'

  get 'articles/create'

  get 'articles/show'

  get 'articles/edit'

  get 'articles/update'

  get 'articles/destroy'

  resources :articles

  root 'page#home'

  get '/about',to: 'page#about'

  end
