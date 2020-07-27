class EducationContentsController < ApplicationController

  before_action :find_econtent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show]



  def index
    @education_contents = policy_scope(EducationContent)
  end

  def show
    find_econtent
  end

  def new
    @education_content = EducationContent.new
    authorize @education_content
  end

  def create
    @education_content = EducationContent.new(educontent_params)
    @education_content.user = current_user
    authorize @education_content
    if @education_content.save
      redirect_to newsfeed_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @education_content.update(owncontent_params)
    redirect_to education_content_path(@education_content), alert: "Content Updated"
  end

  def destroy
   @education_content.destroy
   redirect_to newsfeed_path, alert: "Content Deleted"
  end


  private

  def find_econtent
    @education_content = EducationContent.find(params[:id])
    authorize @education_content
  end

  def educontent_params
    params.require(:education_content).permit(:title, :description, :edu_content, :thumbnail, photos: [])
  end


end
