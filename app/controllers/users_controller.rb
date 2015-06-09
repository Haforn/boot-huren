class UsersController < ApplicationController

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params_register)
		if @user.save
			redirect_to boats_path, notice: "Your account is made"
		else
			render 'new'
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if params[:user][:password].present?
			found_user = User.find(current_user.id)
			if found_user
				authorired_user = found_user.authenticate(params[:user][:password])
			end
		end
		if authorired_user
			if @user.update_attributes(user_params)
				redirect_to user_path, notice: "Your user profile has been updated"
			else
				redirect_to boats_path
			end
		else			
			flash[:notice_fail] = "Invalid password"
			render 'edit'
		end
	end

	private

		def user_params_register
			params.require(:user).permit(:email, :username, :password)
		end

		def user_params
			params.require(:user).permit(:name, :email, :username, :password, :street, :house_number, :zip_code, :residence)
		end

end