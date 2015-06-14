  Rails.application.routes.draw do
  root    'questions#index'
  resources :answers, except: :index do
    resources :votes, only: [:create]
  end
  resources :users

  resources :comments, only: [:edit]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :questions do
    resources :votes, only: [:create]
    resources :comments, except: [:edit]
  end



  # resources :comments
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



end
