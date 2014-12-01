class UsersController < ApplicationController

  def index
    @users = User.all
    # render json: @users
  end

  def create
    @user = User.new(user_params)
      if @user.save
        render json: @user
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
      session = UsersController.create_session(user)
      render json: {user: user, session: session}
    else
      render json: {error: "User not found"}
    end
  end

  def self.create_session(user)
    session_key = "#{SecureRandom.base64}"
    user.session_key = session_key
    user.save
    session_key
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

  def self.create_session(user)
    session_key = "#{SecureRandom.base64}"
    user.session_key = session_key
    user.save
    session_key
  end

end


