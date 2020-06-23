class OwnContentCommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    find_own_content
    @own_content_comment = OwnContentComment.new(own_content_comment_params)
    @own_content_comment.own_content = @own_content
    @own_content_comment.user = current_user
    authorize @own_content_comment
    if @own_content_comment.save
      OwnContentChannel.broadcast_to(
        @own_content,
        render_to_string(partial: "own_content_comment", locals: { own_content_comment: @own_content_comment })
      )
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
