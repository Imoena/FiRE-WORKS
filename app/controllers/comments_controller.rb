class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)

      if @comment.save
      render :index
      else
      redirect_to post_path(@comment.post)
      end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :parent_id)
  end

end
