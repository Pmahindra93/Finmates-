class CommentsController < ApplicationController
  def new
    find_own_content
    @comment = Comment.new(comment_params)
  end

  def create
    find_own_content
    @comment = Comment.new(comment_params)
    @comment.own_content = @own_content
    @comment.user = current_user
    if @comment.save
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

  def comment_params
      params.require(:comment).permit(:content) #rating will be implemented later
  end
end
