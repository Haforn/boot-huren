class UserProfilesController < ApplicationController 

	before_action :set_user_profile, only: [:show, :edit, :update]

	def show
	end

	def edit
	end

	def update
		@user_profile.update_attributes(user_profile_params)
		redirect_to user_profile_path
	end

	private

		def set_user_profile
			@user_profile = UserProfile.find(params[:id])
		end

		def user_profile_params
			params.require(:user_profile).permit(:first_name, :last_name)
		end

end