Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "homes/about" => "homes/about"
  
  resources :users do
   member do
     get :following, :follower
    end
  end
  get "users/user_favorites" => "users/user_favorites"
  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  
  resources :trainings do
  resource :favorites, only: [:create, :destroy]
  resources :training_comments, only: [:create, :destroy]
  end
  
  resources :chats, only: [:show, :index]
end
