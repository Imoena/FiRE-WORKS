class Admins::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    @new_comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :parent_id)
  end
end
