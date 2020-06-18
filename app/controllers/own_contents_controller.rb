class OwnContentsController < ApplicationController

  before_action :find_content, only: [:show, :like, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :like]

  respond_to :js, :html, :json

  def index
    @own_contents = policy_scope(OwnContent)
  end

  def show
    find_content
    @own_content_comment = OwnContentComment.new
  end

  def new
    @own_content = OwnContent.new
    authorize @own_content
  end

  def create
    @own_content = OwnContent.new(owncontent_params)
    @own_content.user = current_user
    authorize @own_content
    if @own_content.save
      redirect_to library_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @own_content.update(owncontent_params)
    redirect_to own_content_path(@own_content)
  end

  def destroy
   @own_content.destroy
   redirect_to library_path
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
    authorize @own_content
  end

  def owncontent_params
    params.require(:own_content).permit(:title, :description, :article, :category, :published_date, :photo, :reading_time)
  end
end
