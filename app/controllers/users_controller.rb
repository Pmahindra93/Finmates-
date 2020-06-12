class UsersController < ApplicationController
#     skip_before_action :authenticate_user!, only: [:home]
  def index
  end

  def show
    @user = User.find(params[:id])
    @userEmail = User.find(params[:id]).email
    @nickname = User.find(params[:id]).nickname

    # @avatar = User.find(params[:id]).avatar

    # def avatar
    #    avatar.variant(resize: "150x150").processed if current_user.avatar.attached?
    # end

  end

private

  # def article_params
  #   params.require(:avatar)
  # end

end
