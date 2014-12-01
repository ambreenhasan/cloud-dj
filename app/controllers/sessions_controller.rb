class UsersController < ApplicationController

  def index

  end

  def create

  end

  def destroy
    session[:user_id] = nil
  end

end
