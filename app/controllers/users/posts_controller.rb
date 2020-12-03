class Users::PostsController < ApplicationController
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
    @comment = Comment.new
    @lat = @post.latitude
    @lng = @post.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def create
    # Eventテーブルのfestival、prefectureを配列で探してきている
    @event = Event.where(festival: params[:post][:festival], prefecture: params[:post][:prefecture])
    @post = Post.new(post_params)
    @post.latitude = params["latitude"]
    @post.longitude = params["longitude"]
    @post.user_id = current_user.id
    # festival、prefectureが一致するものがあったらその配列の0番目をとってくる
    if @event.length > 0
      @post.event_id = @event[0].id
    end
    @user = current_user
    if @post.save
      # リダイレクト先変える
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    if @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
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
    @posts = Post.search(params[:search])
  end

  def prefecture
    @posts = Post.where(prefecture: params[:prefecture])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:festival, :prefecture, :city, :transportation, :status, :impressions, :image, :date, :belongings, :rate, :user_id, :addres, :latitude, :longitude)
  end
end
