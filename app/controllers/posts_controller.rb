class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

 def new
 	@post = Post.new
 end

 def index
 	@posts = Post.all
 end

 def show
 	@comments = @post.comments
  @comment = @post.comments.new #投稿全体へのコメント投稿用
  @comment_reply = @post.comments.new #コメントに対する返信用
  # @like = Like.new
 end

 def create
 	@post = Post.new(post_params)
 	@post.user_id = current_user.id
  @user = current_user
 	if @post.save
 	# リダイレクト先変える
 	   redirect_to post_path(@post)
  else
     @post = Post.new(post_params)
     render :new
  end
 end

 def edit
   if @post.user == current_user
      render "edit"
   else
      redirect_to books_path
   end
 end

 def update
    if @post.update(post_params)
      # flash[:notice] = "You have updated post successfully."
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end


 def destroy
	@post.destroy
	redirect_to user_path(current_user)
 end

 def search
    # @players = Player.search(params[:search])
    @posts = Post.search(params[:search])
 end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:festival, :prefecture, :city, :transportation, :status, :impressions, :image, :date, :belongings, :rate, :user_id)
  end

end