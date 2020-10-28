class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.new(comment_params)
   @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @post = @comment.post
   if @comment.user != current_user
    # リダイレクト先考える
      redirect_to request.referer
   else
      @comment.destroy
      redirect_to post_path(@post)
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :parent_id)
  end
end
