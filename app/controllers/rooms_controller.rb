class RoomsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @room = Room.find(session[:room_id])
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = session[:user_id]
    @id = @room.id
    @name = @room.name
    @user_id = session[:user_id]
    @description = @room.description
    respond_to do |f|
      if @room.save
        f.js { render :new_room }
      else
        f.js { render :room_errors }
      end
    end
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.update(room_params)
    if @room.save
      flash[:notice] = "Room updated!"
      redirect_to user_room_path
    else
      flash[:notice] = "Room failed to update"
      redirect_to user_room_path
    end
  end

  def join
    user = User.find_by(id: params[:user_id])
    room = Room.find_by(id: params[:id])
    @join = RoomUser.new(user_id: user.id, room_id: room.id)
    format.js { render :join_room, :locals => {room: @join } } if @join.save
  end

  def destroy
    @id = params[:id]
    room = Room.find(params[:id])
    room.destroy
    respond_to do |format|
      format.js { render :my_rooms_carousel }
    end
  end

  def chat
    p params
    p "9" * 100
    @chat = Chat.new(chat_params)
    @chat.user_id = session[:user_id]
    @chat.room_id = session[:room_id]
    p @chat
    respond_to do |format|
      if @chat.save
        format.js { render :chat_success, :locals => {chat: @chat} }
      else
        format.js { render :chat_failure }
      end
    end
  end


  private

  def room_params
    params.require(:room).permit(:name, :description, :publicness, :user_id)
  end

  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :content)
  end

end
