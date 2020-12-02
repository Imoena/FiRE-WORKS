class Users::UsersController < ApplicationController

	def like
		 @user = current_user
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.where(status: :published)  #.published.order("created_at DESC").page(params[:page]).per(10)
	end

	def confirm
		@user = current_user
        @posts = @user.posts.where(status: :draft) #.draft.order("created_at DESC")
    end

	def edit
		@user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    if @user.update(user_params)
	       redirect_to user_path(@user.id)
	    else
	    	render :edit
	    end
	end

	def edit_password
        @user = current_user
	end

	def cancel_confirmation
		@user = current_user
	end

	# def destroy
	#     @user = User.find(params[:id])
	#     @user.destroy
	#     flash[:success] = 'ご利用ありがとうございました'
	#     redirect_to :root
    # end

    def hide
        @user = User.find(params[:id])
        @user.update(is_deleted: true)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end

    private

	def user_params
	  params.require(:user).permit(:name, :profile_image, :introduction)
	end

end

