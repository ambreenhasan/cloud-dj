class UserStarsController < ApplicationController
  def create

  end

  def index
    user = User.find_by(id: params[:user_id])
    @user_stars = user.user_stars
    render json: @user_stars
  end

end