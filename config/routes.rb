PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  get 'register', to: 'users#new', as: 'register' # creating a named path called register_path instead of new_user_path. as: 'register' is optional. 

  # creating a route to login and logout 
  # using the notion of a session to set up CRUD type action(CRUD type because no db record is involved)
  # setting up the URI for session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  

  #instead of creating the routes explicitly as in lines 9,10 & 11 resources session, only: [:new, :create, :destroy] can be used.
  #However method above also prevents the standard named routes being created ie. new_sessions_path etc.
  #Instructor also recommends that resources are retained for models because CRUD actions are being performed with a model. Sessions is not a model.
  #Therefore one off routes are used for non model backed entities.
  resources :posts, except: [:destroy] do
  	resources :comments, except: [:destroy] do
      member do
        post :vote
      end
    end
     
    member do
      post :vote
    end
  end
  resources :categories, only: [:new, :create, :show]  #restricted categories to new, create and show from except: [:destroy]
  resources :users, only: [:show, :create, :edit, :update]  # limiting to only :create action since on line 4 the register_path is created for users#new action

end


