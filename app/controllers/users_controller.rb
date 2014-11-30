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


  def current_user
    user = User.find_by(session_key: params[:session_key])
    render json: user
  end

  # def create
  #   p "*"*100
  #   p params
  #   if params[:user][:password] == params[:user][:password_confirm]
  #     user = User.new(user_params)
  #     if user.save
  #       session = UsersController.create_session(user)
  #       render json: { session: session, user: user, success: "You have logged in!"}
  #     else
  #       render json: {error: "Error has occured. Please try again."}
  #     end
  #   end
  # end


  def login
    user = User.find_by_email(params[:user][:email])
    if user == user.authenticate(params[:user][:password])
      notifications = Notification.where(user_id: user.id)
      session = UsersController.create_session(user)
      render json: {user: user, session: session, notifications: notifications}
    else
      render json: {error: "User not found"}
    end
  end

  def notifications
    notifications = Notification.where(user_id: params[:id]).order('created_at desc')
    user_status = User.find(params[:id]).status
    render json: {notifications: notifications, user_status: user_status}
  end

  def self.create_session(user)
    session_key = "#{SecureRandom.base64}"
    user.session_key = session_key
    user.save
    session_key
  end

  def user_params
    params.require(:user).permit(:email, :bio, :password, :first_name, :last_name, :street, :city, :state, :zip)
  end

  def logout
    user = User.find_by_session_key(params[:session_key])
    user.session_key = nil
    user.save
    #clear session key, unset in user's table
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end


