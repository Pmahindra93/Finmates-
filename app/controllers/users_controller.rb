class UsersController < ApplicationController
# include Pundit
#     skip_after_action :verify_authorized, only: [:home]

#     skip_before_action :authenticate_user!, only: [:home]

  def index
    # @wishes = policy_scope(Wish).where(user: current_user)
    # @wishes = Wish.all
    # @users = User.all

    # @email = @users[0].email
  end

  def show
    @user = User.find(params[:id])
  end

end

