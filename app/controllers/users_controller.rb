class UsersController < ApplicationController

	def show
		@user = current_user
	end

	def edit
	end

	def update
	end

	def quit
	end

	def hide
		current_user.update(status: false)
		#会員ステータスをfalse（退会）に変更
		reset_session
		redirect_to users_thank_path
	end

	def thank
	end

end
