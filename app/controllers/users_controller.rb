class UsersController < ApplicationController

  def index
      @users = User.all
      @rooms = Room.where(publicness: "t")
    if session[:user_id]
      p RoomUser.where(user_id: session[:user_id])
      @joined_rooms = RoomUser.where(user_id: session[:user_id])
      @my_rooms = Room.where(user_id: session[:user_id])
      @user = User.find(session[:user_id])
    end


    if params
      session[:room_id] = params[:id]
      # doesn't add user to this room in DB yet.
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
        format.js { render :created_user }
      else
        session[:errors] = @user.errors.full_messages
        format.js { render :signup_error }
      end
    end
    # session[:errors] = nil
  end

  def login
    p params
    p "1" * 100
    @user = User.find_by_email(params[:email])
    p @user
    respond_to do |format|
      if (@user != nil) && (@user.password == params[:password] )
        session[:user_id] = @user.id
        format.js { render :created_user }
      else
        session[:errors] = "Invalid username or password :("
        format.js { render :login_error }
      end
    end
  end

  def logout
    session[:user_id] = nil
    respond_to do |format|
      format.js { render :logout }
    end
  end

  def room_session
    p "win" * 100
    p params
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


