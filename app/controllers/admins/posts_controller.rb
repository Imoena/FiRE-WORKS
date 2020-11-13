class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

 def new
 	@post = Post.new
 end

 def index
 	@posts = Post.all
 end

 def show
    @comments = @post.comments
    @comment = Comment.new 
    @lat = @post.latitude
    @lng = @post.longitude
    gon.lat = @lat
    gon.lng = @lng
 end


 def edit
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
  @user = @post.user
	@post.destroy
	redirect_to admins_user_path(@user)
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
