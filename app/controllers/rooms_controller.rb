class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    @room = Room.new
    render json: @rooms
  end

  def create
    p params
    p "$" *100
    @room = Room.new(room_params)
    respond_to do |f|
      if @room.save
        f.js { render :new_room }
      else
        f.json { render :index }
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

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to user_rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :publicness, :user_id)
  end

end
