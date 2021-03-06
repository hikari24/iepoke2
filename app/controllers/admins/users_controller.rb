class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.page(params[:page]).per(15)
	end

	def show
		@user = User.find(params[:id])
	end

private
	def user_params
		params.require(:user).permit(:name, :email, :status)
	end
end
