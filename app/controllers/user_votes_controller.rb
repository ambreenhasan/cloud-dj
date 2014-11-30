class UserVotesController < ApplicationController
  def create
  end

  def new
  end

  def index
    @usersVotes = UserVote.all
    render json: @usersVotes
  end
end