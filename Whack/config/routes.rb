  Rails.application.routes.draw do
  root    'questions#index'
  resources :answers, except: :index
  resources :users


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :questions do
    resources :comments, except: [:edit]
  end


  resources :comments

  # resources :comments
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'users#new'




end
