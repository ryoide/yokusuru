class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@problems = @user.problems
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		current_user.update(update_params)
	end

	def destroy
		user = User.find(params[:id])
		if user.id == current_user.id
			user.destroy
		end
		redirect_to :root and return
	end

	private
	def update_params
		params.require(:user).permit(:name, :avatar)
	end
end
