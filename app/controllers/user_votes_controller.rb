class UserVotesController < ApplicationController
  def index

    @user_votes = UserVote.find_by(room_id: params[:room_id])
    p 'params'
    p params
    p 'all uservotes'
    p UserVote.all
    p 'selected uservotes'
    p @user_votes
    render json: @user_votes
  end

  def create
    # @user_vote = UserVote.new(user_vote_params)
    # respond_to do |f|
    #     f.json { render json: @user_vote } if @user_vote.save
    # end
  end

  # def new
  # end
  private

  def user_vote_params
    params.require(:user_vote).permit(:user_id, :room_id, :song_id)
  end

end