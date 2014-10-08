PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  # resources :posts, except: [:destroy]
  get '/register', to: 'users#new' #creates register_path automatically

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
  
  resources :posts, except: [:destroy] do
    member do
      post :vote  # /posts/:id/vote
      # get :flag
    end
    # collection do
    #   get :archives
    # end
    resources :comments, only: [:create] do
      member do
        post :vote  # /posts/:id/vote
        # get :flag
      end
    end
  end

  resources :users, except: [:index, :destroy]

  # get '/dogs', to: 'dogs#index'
  # get '/dogs/:id', to: 'dogs#show'
  # get '/dogs/new', to 'dogs#new'
  # post '/dogs', to: 'dogs#create' 
  # get '/dogs/:id/edit', to: 'dogs#edit'
  # patch '/dogs/:id', to: 'dogs#update'
  # delete '/dogs/:id', to: 'dogs#destroy'

end
