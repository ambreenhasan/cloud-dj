class RoomInvitesController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    @invites_extended = user.invites_extended
    @invites_received = user.invites_received
    render json: @invites_extended if user.invites_extended.length > 0
    render json: @invites_received if user.invites_received.length > 0
  end

  def create
    @room_invite = RoomInvite.new(room_invite_params)
    respond_to do |f|
      f.json { render json: @room_invite } if @room_invite.save
    end
  end

  def destroy
    room_invite = RoomInvite.find_by(id: params[:id])
    room_invite.destroy
  end

  private
  def room_invite_params
    params.require(:room_invite).permit(:inviter_id, :invitee_id, :room_id, :accepted)
  end
end