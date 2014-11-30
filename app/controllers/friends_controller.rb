class FriendsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    @friends = Friend.where(inviter_id: params[:user_id])
    render json: @friends
  end

  def create
    @friend = Friend.new(friend_params)
    respond_to do |f|
      if @friend.save
        f.json { render json: @friend }
      else
        f.json { redirect_to user_friends_path }
      end
    end
  end

  def destroy
    friend = Friend.find(params[:id])
    friend.destroy
    redirect_to user_friends_path
  end

  private

  def friend_params
    params.require(:friend).permit(:inviter_id, :invitee_id)
  end

end