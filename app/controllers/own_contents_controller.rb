class OwnContentsController < ApplicationController

  before_action :find_content, only: [:show, :like]
  before_action :authenticate_user!, only: [:like]

  respond_to :js, :html, :json

  def index
  end

  def show
    find_content
  end

  def like
    if current_user.voted_for? @own_content
      @own_content.unliked_by current_user
    else
      @own_content.liked_by current_user
    end
  end

  private

  def find_content
    @own_content = OwnContent.find(params[:id])
  end
end
