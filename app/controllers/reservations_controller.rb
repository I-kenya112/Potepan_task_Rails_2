class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.where(user_id: current_user.id).all
    @room = Room.where(user_id: current_user.id).all
  end

  def new
    @room = Room.find(params[:room_id])
    @user = current_user
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    if current_user == @room.user_id
      flash[:alert] = "オーナーが予約することはできません。"
    else
      if @reservation.save
        flash[:notice] = "予約が完了しました。"
        redirect_to @room
      else
        render :index
      end
    end
  end

  def destroy
    @reservation = Reservation.find_by(room_id:params[:room_id], user_id:current_user.id)
    @room = @reservation.room
    @reservation.destroy
    flash.now[:notice] = "予約を削除しました"
    redirect_to :reservations
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :reserve_start, :reserve_end, :reserve_people, :reserve_price, :reserve_days)
  end
end
