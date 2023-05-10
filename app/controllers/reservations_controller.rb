class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.where(user_id: current_user.id).all
    @room = Room.where(user_id: current_user.id).all
  end

  def new
    @room = Room.find(params[:room_id])
    @user = current_user
    if @room && @user
      @reservation = Reservation.new
    else
      redirect_to root_path, alert: "エラーが発生しました。"
    end
  end

  def create
    @user = current_user
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
  
    if @reservation.reserve_start.present? && @reservation.reserve_end.present?
      @reservation.reserve_days = (@reservation.reserve_end - @reservation.reserve_start).to_i
      @reservation.reserve_total = @reservation.reserve_price * @reservation.reserve_people * @reservation.reserve_days
  
      if @reservation.save
          flash[:notice] = "予約が完了しました。"
          redirect_to reservations_path
      else
          flash.now[:alert] = "予約できませんでした"
          render :new
      end
    else
      flash.now[:alert] = "開始日と終了日を入力してください"
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to reservations_path, notice: "予約を削除しました。"
    else
      flash[:alert] = "問題が発生しました。"
      render "index"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :reserve_start, :reserve_end, :reserve_people, :reserve_price, :reserve_days)
  end
end
