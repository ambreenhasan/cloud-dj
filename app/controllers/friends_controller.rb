class FriendsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    @friends = Friend.where(inviter_id: params[:user_id])
    render json: @friends
  end

  # def create
  #   @create_friend =
  # end

  def destroy
  end

  private
  def question_params
    params.require(:friend).permit(:inviter_id, :invitee_id)
  end

end