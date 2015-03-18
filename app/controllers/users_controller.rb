class UsersController < ApplicationController

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to boats_path, notice: "Your account is made"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if current_user.update_attributes(user_params)
			redirect_to user_path, notice: "Your user profile has been updated"
		else
			render 'edit'
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email)
		end

end