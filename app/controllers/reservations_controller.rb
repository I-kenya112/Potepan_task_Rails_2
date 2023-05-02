class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if current_user == room.user
      flash[:alert] = "オーナーが予約することはできません。"
    else
      if @reservation.save
        flash[:notice] = "予約が完了しました。"
        redirect_to room
      else
        render :new
      end
    end
  end


  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :reserve_people)
  end
end
