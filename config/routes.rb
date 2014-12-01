Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"

  # root 'application#index'
  root 'users#index'

  # get '*path' => 'application#index'

  # root 'application#index' #don't remove these two lines
  # get '*path' => 'application#index' #don't remove these two lines

 post 'users/login' => "users#login"
 post 'users/logout' => "users#logout"
 post '/search' => "search#search"


  resources :users do
    resources :user_votes, only: [:create]
    resources :friends, only: [:index, :create, :destroy]
    resources :room_invites, only: [:index, :create, :destroy]
    resources :rooms, except: [:edit]
    resources :songs, except: [:new, :edit, :update]
    resources :user_stars, only: [:create, :index]
  end
  resources :rooms, only: [:index] do
    resources :user_votes, only: [:index]
  end
end




