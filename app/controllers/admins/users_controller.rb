class Admins::UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
    	@users = User.all
    end

    def like
		 @user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.where(status: :published)  #.published.order("created_at DESC").page(params[:page]).per(10)
	end

	def confirm
		@user = User.find(params[:id])
        @posts = @user.posts.where(status: :draft) #.draft.order("created_at DESC")
    end

	def edit
		@user = User.find(params[:id])
		@user = User.find_by(params[:user_id])
	end

	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to user_path(@user.id)
	end

	def destroy
	    @user = User.find(params[:id])
	    @user.destroy
	    flash[:success] = 'ご利用ありがとうございました'
	    redirect_to :root
    end

    def search
        @users = User.search(params[:search])
    end


    private

	def user_params
	  params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
