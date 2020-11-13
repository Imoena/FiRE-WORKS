class Users::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.new(comment_params)
   @comment.user_id = current_user.id
   if @comment.save
    @comment = Comment.new
   else
    @comment = Comment.new
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @post = @comment.post
   if @comment.user != current_user
    # リダイレクト先考える
      redirect_to request.referer
   else
      @comment.destroy
      @new_comment = Comment.new
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :parent_id)
  end
end
