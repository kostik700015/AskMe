Rails.application.routes.draw do

  resources :users, only: %i[new create]
  resources :questions do
    

    resources :answers, only: [:create, :destroy,:edit, :update]
  end
  
  # get '/questions', to: 'questions#index' #localhost/questions
  
  # get '/questions/new', to: 'questions#new'

  # get '/questions/:id/edit', to: 'questions#edit' 
  
  # post '/questions', to: 'questions#create'
  
    root 'pages#index'
end
