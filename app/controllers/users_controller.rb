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
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        p "3" * 100
        format.js { render :created_user }
      else
        session[:errors] = @user.errors.full_messages
        format.js { render :signup_error }
      end
    end
    # session[:errors] = nil
  end

  def login
    respond_to do |format|
      if @user = User.find_by_email(params[:email]) == nil
        session[:user_id] = @user.id
        format.html { render :index }
      else
        session[:errors] = "Invalid username or password :("
        format.js { render :login_error }
      end
    end
  end

  def logout
    p "1" * 100
    session[:user_id] = nil
    respond_to do |format|
      format.js { render :logout }
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

end


