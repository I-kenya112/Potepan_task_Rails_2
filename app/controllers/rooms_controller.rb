class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  def index
     @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice] = "施設が登録されました"
      redirect_to @room
    else
      flash[:alert] = "問題が発生しました。"
      render :new
    end
  end
  
  def show
    @user = current_user
    @room = Room.find(params[:id])
    #reservation(予約)を新規作成予定
    # @reservation = Reservation.new
  end
  
  def listing
  end
  
  def pricing
  end
  
  def description
  end
  
  def photo_upload
  end
  
  def amenities
  end
  
  def location
  end
  
  def update
    new_params = room_params
    if @room.update(new_params)
      flash[:notice] = "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
    end
    redirect_back(fallback_location: request.referer)
  end
  
  private
    def set_room
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:room_name, :room_intro, :room_price, :room_address)
    end

end
