class UsersController < ApplicationController

  def index

  end

  def create
    p params
    p "4" * 100
  end

  def destroy
    session[:user_id] = nil
  end

end
