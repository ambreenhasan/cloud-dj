class FriendsController < ApplicationController

  def index
    user = User.find_by(invitee_id: )
    @friends = Friend.where(user_id)
    respond_to do |f|
      f.json { render json: @friends.to_json }
    end
  end

  def create
    @create_friend =
  end

  def new
  end

  def destroy
  end

  private
  def question_params
    params.require(:friend).permit(:inviter_id, :invitee_id)
  end

end