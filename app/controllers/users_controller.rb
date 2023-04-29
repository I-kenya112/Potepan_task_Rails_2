class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image = "default-avatar.png"
    if @user.save
      log_in @user
      flash[:success] = "プロフィールを登録しました"
      redirect_to @user #マイページ
    else
      render 'new'
    end
  end

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(update_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
