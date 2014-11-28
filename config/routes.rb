Rails.application.routes.draw do

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


