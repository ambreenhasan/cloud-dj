class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |f|
      f.json { render json: @users }
    end
  end

  def create
    @user = User.new(params)
    respond_to do |f|
      f.json { render json: @user } if @user.save
    end
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find_by(id: current_user.id)
    respond_to do |f|
      f.json { render json: @user.to_json } if @user.save
    end
  end

  def update
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
  end

  # private
  # def user_params
  #   params.require(:user).permit(:email, :first_name, :last_name, :password)
  # end

end