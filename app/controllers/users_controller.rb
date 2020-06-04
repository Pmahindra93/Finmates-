class UsersController < ApplicationController
#     skip_before_action :authenticate_user!, only: [:home]
  def index
  end

  def show
    @user = User.find(params[:id])

    @userEmail = User.find(params[:id]).email

  end

end
