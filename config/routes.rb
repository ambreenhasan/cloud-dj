Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :friends, only: [:index, :create, :new, :index, :destroy]
    resources :room_invites, only: [:create, :new, :destroy]
    resources :rooms
    resources :songs
    resources :user_stars, only: [:create, :new, :index]
    resources :user_votes, only: [:create, :new, :index]
  end
end


