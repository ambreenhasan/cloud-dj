class UserVotesController < ApplicationController
  def index
    @song_votes = UserVote.where(room_id: params[:room_id])
    render json: @song_votes
  end

  def create
    @user_vote = UserVote.new(user_vote_params)
    respond_to do |f|
      f.json { render json: @user_vote } if @user_vote.save
    end
  end

  private

  def user_vote_params
    params.require(:user_vote).permit(:user_id, :room_id, :song_id)
  end

end