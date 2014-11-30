class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    respond_to do |f|
        f.json { render json: @user } if @user.save
    end
  end

  def new

  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end