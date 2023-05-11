class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.new
  end
  
  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "施設が登録されました"
      redirect_to :rooms
    else
      flash[:alert] = "問題が発生しました。"
      render "new"
    end
  end
  
  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end

  def update
    new_params = room_params
    @room = Room.find(params[:id])
    if @room.update(new_params)
      flash[:notice] = "保存しました。"
      redirect_to rooms_url
    else
      flash[:alert] = "問題が発生しました。"
      render "edit"
    end
  end

  def search
    @q = Room.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path, notice: "施設を削除しました"
    else
      flash[:alert] = "問題が発生しました。"
      render "index"
    end
  end
  
  private


  def room_params
    params.require(:room).permit(:room_name, :room_intro, :room_price, :room_address, :room_image)
  end

end
