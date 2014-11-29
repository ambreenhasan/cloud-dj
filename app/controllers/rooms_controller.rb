class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    render json: @rooms
  end

  def create
    @room = Room.new(room_params)
    respond_to do |f|
      if @room.save
        p @room
        f.json { render json: @room }
      else
        f.json { render :index }
        f.html { redirect_to user_rooms_path, notice: "Failed to save"}
      end
    end
  end

  #  new_user_room GET    /users/:user_id/rooms/new(.:format)        rooms#new
  # def new
  #   @room = Room.new
  # end

  # def edit
  #   @room = Room.find(params[:id])
  # end

  # def show
  #   @room = Room.find(params[:id])
  # end

  # def update
  #   @room = Room.find(params[:id])
  #   if @room.update(room_params)
  #     redirect_to @room
  #   else
  #     render 'edit'
  #   end
  # end

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