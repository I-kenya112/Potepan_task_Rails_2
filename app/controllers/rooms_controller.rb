class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  def index
     @rooms = current_user.rooms.all
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
    @rooom = Room.find(params[:id])
    if @room.update(new_params)
      flash[:notice] = "保存しました。"
      redirect_to rooms_url
    else
      flash[:alert] = "問題が発生しました。"
      render "edit"
    end
    redirect_back(fallback_location: request.referer)
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:room_name, :room_intro, :room_price, :room_address, :room_image)
    end

end
