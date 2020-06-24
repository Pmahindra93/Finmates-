class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update]


  def show
    @userEmail = @user.email
    @nickname = @user.nickname
  end

  def update
    @user.update(user_params)
    redirect_to user_path
  end

private

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
