class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
  end

  def profile
    @user = current_user
  end

  def update_profile
    if current_user.update(user_params)
      flash[:success] = "プロフィールが更新されました"
      redirect_to user_path(current_user)
    else
      render :profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :icon)
  end
end