PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
  	resources :comments, except: [:destroy]
  end
  resources :categories, only: [:new, :create, :show]  #restricted categories to new, create and show from except: [:destroy]
  resources :users
  

end
