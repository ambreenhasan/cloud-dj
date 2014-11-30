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
    resources :friends, only: [:index, :create, :destroy]
    resources :room_invites, only: [:index, :create, :destroy]
    resources :rooms, except: [:new, :edit]
    resources :songs, except: [:new, :edit, :update]
    resources :user_stars, only: [:create, :index]
    resources :user_votes, only: [:create, :index]
  end
  resources :rooms, only: [:index]
end


