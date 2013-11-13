PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  get 'register', to: 'users#new', as: 'register' # creating a named path called register_path instead of new_user_path. as: 'register' is optional. 

  resources :posts, except: [:destroy] do
  	resources :comments, except: [:destroy]
  end
  resources :categories, only: [:new, :create, :show]  #restricted categories to new, create and show from except: [:destroy]
  resources :users
  

end
