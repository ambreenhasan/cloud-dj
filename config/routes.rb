Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  # root 'application#index'
  # root 'users#index'

  # get '*path' => 'application#index'

  root 'application#index' #don't remove these two lines
  # root 'soundcloud#search' #don't remove these two lines
  get '*path' => 'application#index' #don't remove these two lines


 post 'soundcloud/search' => "soundcloud#search"

  resources :users do
    resources :friends, only: [:index, :create, :new, :destroy]
    resources :room_invites, only: [:index, :create, :new, :destroy]
    resources :rooms
    resources :songs
    resources :user_stars, only: [:create, :new, :index]
    resources :user_votes, only: [:create, :new, :index]
  end
  resources :rooms, only: [:index]
end




