class FriendsController < ApplicationController

  def index
    user = User.find_by(id: current_user.id)
    @friends = user.friends
    respond_to do |f|
      f.json { render json: @friends.to_json }
    end
  end

  def create
    @create_friend =
  end

  def destroy
  end

  private
  def question_params
    params.require(:friend).permit(:inviter_id, :invitee_id)
  end

end