Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'application#index'
  get '*path' => 'application#index'

  get 'api_key' => 'api_key#soundcloud'

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


