class UserStarsController < ApplicationController
  def create
    p 'params is:'
    p params
    p 'user_star_params is:'
    p user_star_params
    @user_star = UserStar.new(user_star_params)
    render json: @user_star if @user_star.save
  end

  def index
    user = User.find_by(id: params[:user_id])
    @user_stars = user.user_stars
    render json: @user_stars
  end

  private
  def user_star_params
    params.require(:user_star).permit(:user_id, :song_id)
  end

end