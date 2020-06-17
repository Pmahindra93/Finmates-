class DidyouknowsController < ApplicationController

before_action :find_content, only: [:show, :like, :edit, :update, :destroy]

def index
    @didyouknows = policy_scope(Didyouknow)
  end

  def show
    find_did_you_know
  end

  def new
    @didyouknow = Didyouknow.new
    authorize @didyouknow
  end

  def create
    @didyouknow = Didyouknow.new(didyouknow_params)
    @didyouknow.user = current_user
    authorize @didyouknow
    if @didyouknow.save
      redirect_to library_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @didyouknow.update(didyouknow_params)
    redirect_to own_content_path(@own_content)
  end

  def destroy
   @didyouknow.destroy
   redirect_to library_path
  end


  private

  def find_did_you_know
    @didyouknow = Didyouknow.find(params[:id])
    authorize @didyouknow
  end

  def didyouknow_params
    params.require(:didyouknow).permit(:title, :description,:article, :published_date, :image)
  end
end

end
