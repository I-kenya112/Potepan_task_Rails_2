class HomesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @q = Room.ransack(params[:q])
  end

  def search
    @results = @q.result
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
