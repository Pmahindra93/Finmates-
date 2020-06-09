class OwnContentCommentsController < ApplicationController
  def new
    find_own_content
    @own_content_comment = OwnContentComment.new(own_content_comment_params)
  end

  def create
    find_own_content
    @own_content_comment = OwnContentComment.new(own_content_comment_params)
    @own_content_comment.own_content = @own_content
    @own_content_comment.user = current_user
    if @own_content_comment.save
      flash[:success] = "Comment was posted successfully"
      redirect_to own_content_path(@own_content)
    else
      flash[:alert] = "Comment could not be posted"
      render "own_contents/show"
    end
  end

  private

  def find_own_content
    @own_content = OwnContent.find(params[:own_content_id])
  end

  def own_content_comment_params
      params.require(:own_content_comment).permit(:content) #rating will be implemented later
  end
end
