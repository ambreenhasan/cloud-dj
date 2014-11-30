Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  # root 'application#index'
  root 'users#index'

  # get '*path' => 'application#index'

  # get 'api_key' => 'api_key#soundcloud'
  # get 'api_key' => 'api_key#youtube'

  resources :users do
    resources :friends, only: [:index, :create, :new, :destroy]
    resources :room_invites, only: [:index, :create, :new, :destroy]
    resources :rooms
    resources :songs
    resources :user_stars, only: [:create, :new, :index]
    resources :user_votes, only: [:create]
  end
  resources :rooms, only: [:index] do
    resources :user_votes, only: [:index]
  end
end


