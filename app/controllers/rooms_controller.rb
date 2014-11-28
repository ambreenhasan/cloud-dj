class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render new_user_room
    end
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room
    else
      render 'edit'
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to user_rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:name, :description, :private, :moderator)
  end

end