class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update]

  def index
  end

  def show
    @userEmail = @user.email
    @nickname = @user.nickname
    @firstName = @user.first_name
    @lastName = @user.last_name
  end

  def update
    @user.update(user_params)
    redirect_to user_path
  end

  def edit
  end

private

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:avatar, :email, :nickname, :first_name, :last_name)
  end
end
