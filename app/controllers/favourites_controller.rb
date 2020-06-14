class FavouritesController < ApplicationController
  def index
    @favourites = policy_scope(Favourite).order(created_at: :desc)
  end

  def new
    @favourite = Favourite.new
    authorize @favourite
  end

  def create
    @own_content = OwnContent.find(params[:own_content_id])
    @favourite = Favourite.new
    @favourite.own_content = @own_content
    @favourite.user = current_user
    authorize @favourite
    @favourite.save
    redirect_to own_content_path(@own_content)
  end


end
