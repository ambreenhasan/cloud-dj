class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    render json: @rooms
  end

  def create
    @room = Room.new(room_params)
    respond_to do |f|
      if @room.save
        f.json { render json: @room }
      else
        f.json { render :index }
        f.html { redirect_to user_rooms_path, notice: "Failed to save"}
      end
    end
  end

  # def new
  #   @room = Room.new
  # end

  def edit
    @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.update(room_params)
    if @room.save
      flash[:notice] = "Room updated!"
      redirect_to user_rooms_path
    else
      flash[:notice] = "Room FAILed to update"
      redirect_to user_rooms_path
    end
  end

  # def destroy
  #   room = Room.find(params[:id])
  #   room.destroy
  #   redirect_to user_rooms_path
  # end

  private
  def room_params
    params.require(:room).permit(:name, :description, :publicness, :user_id)
  end

end