class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]


  def show
    @userEmail = @user.email
    @nickname = @user.nickname
    @firstName = @user.first_name
    @lastName = @user.last_name
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User Updated"
    else
      render :edit
    end
  end



private

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :nickname)
  end

end
