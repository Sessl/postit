PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
  	resources :comments, except: [:destroy]
  end
  resources :categories, except: [:destroy]
  
  

end
