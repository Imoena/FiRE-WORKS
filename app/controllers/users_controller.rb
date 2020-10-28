class UsersController < ApplicationController

	def like
		 @user = current_user
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to user_path(@user.id)
	end

	def cancel
		@user = current_user
	end

	def destroy
	    @user = User.find(params[:id])
	    @user.destroy
	    flash[:success] = 'ご利用ありがとうございました'
	    redirect_to :root
    end

    private

	def user_params
	  params.require(:user).permit(:name, :profile_image, :introduction)
	end

end

