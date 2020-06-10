class OwnContentsController < ApplicationController

  before_action :find_content, only: [:show, :like]
  before_action :authenticate_user!, only: [:index, :show, :like]

  respond_to :js, :html, :json

  def index
    @own_contents = OwnContent.all
    @today_content = @own_contents.select {|own_content|  own_content.published_date >= (Date.today()-7) && own_content.published_date <= Date.today() }
    @week_date = Date.today()-7
  end

  def show
    find_content
    @own_content_comment = OwnContentComment.new
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
