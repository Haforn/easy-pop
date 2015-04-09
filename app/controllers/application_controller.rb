class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :view_user

 	private

	  def view_user
	    if session[:view_user_id]
	      view_user ||= User.find(session[:view_user_id])
	    end
	  end
	  
end
