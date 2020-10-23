class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]


 def new
 	@post = Post.new
 end

 def index
 	@posts = Post.all
 end

 def show
 	@post = Post.find(params[:id])
 	@comments = @post.comments
    @comment = @post.comments.new #投稿全体へのコメント投稿用の変数
    @comment_reply = @post.comments.new #コメントに対する返信用の変数
 end

 def create
 	post = Post.new(post_params)
 	@post.user_id = current_user.id
 	if @post.save
 	# リダイレクト先変える
 	   redirect_back(fallback_location: root_path)
    else
       redirect_back(fallback_location: root_path)
    end
 end


 def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to post_images_path
 end

  private
  def post_params
    params.require(:post).permit(:festival, :prefecture, :city, :transportation, :status, :impressions, :image_id, :date, :belongings)
  end

end