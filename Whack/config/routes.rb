  Rails.application.routes.draw do
  root    'questions#index'

  resources :comments
  resources :users
  resources :answers, only: [:update, :destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :questions do
    resources :votes, only: [:create]
    resources :comments, except: [:edit]
    resources :answers, only: [:create, :edit] do
      resources :votes, only: :create
    end
  end

  # resources :comments
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



end
