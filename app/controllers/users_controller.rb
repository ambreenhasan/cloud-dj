class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    p params
    @user = User.new(user_params)
      if @user.save
        render json: @user
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
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "User Successfully Updated"
      redirect_to @user
    else
      flash[:notice] = "User FAILed to update"
      redirect_to @user
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
