class UsersController < ApplicationController
#     skip_before_action :authenticate_user!, only: [:home]
  def index
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @userEmail = User.find(params[:id]).email
    @nickname = User.find(params[:id]).nickname

  end

end
