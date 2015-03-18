class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def login
		# login form
		if session[:user_id]
			redirect_to boats_path
		end
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
  		found_user = User.where(:username => params[:username]).first
	  	if found_user
	  		authorired_user = found_user.authenticate(params[:password])
	  	end
  	end
  	if authorired_user
  		# mark user as logged in
      session[:user_id] = authorired_user.id
      session[:username] = authorired_user.username
  		redirect_to boats_path
  	else
  		redirect_to login_path
  	end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to boats_path
  end

end