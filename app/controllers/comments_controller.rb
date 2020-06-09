class CommentsController < ApplicationController
  def create
    @own_content = OwnContent.find(params[:own_content_id])
    @comment = Comment.new(comment_params)
    # authorize @comment
    @comment.own_content = @own_content
    @comment.user = current_user
    if @comment.save
      redirect_to_own_content_path(@own_content, anchor: "comment-#{@comment.id}")
    else
      render "own_contents/show"
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:content, :rating) #rating will be implemented later
  end
end
