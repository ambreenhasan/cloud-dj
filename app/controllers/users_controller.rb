class UsersController < ApplicationController

  def index
    # @rooms = Room.all
    # @room = Room.new
    # session[:user_id] = 1
    # @user = User.new
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "User Successfully Updated"
      redirect_to @user
    else
      flash[:notice] = "User failed to update"
      redirect_to @user
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_path
  end


  def current_user
    session[:user_id]
    # @user = User.find(session[:user_id])
  end

  def create
    p "*"*100
    p params
    # if params[:user][:password] == params[:user][:password_confirm]
    @user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        render(:action => 'index')
        # session = UsersController.create_session(user)
        # render json: { session: session, user: user, success: "You have logged in!"}
      # else
        # render json: {error: "Error has occured. Please try again."}
      # end
      else
        session[:errors] = @user.errors.full_messages
        p "fail" * 20
        p session[:errors]
    end
  end

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


