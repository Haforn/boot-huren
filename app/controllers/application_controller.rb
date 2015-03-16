class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user

  private

    def confirm_logged_in
      unless session[:user_id]
        redirect_to login_path, notice: "Please log in"
        return false # halts the before_action
      else
        return true
      end
    end

    def set_current_user
  		if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    end

end
