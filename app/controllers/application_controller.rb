class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  helper_method :team_requests

  helper_method :view_user

 	private

	  def view_user
	    if session[:view_user_id]
	      view_user ||= User.find(session[:view_user_id])
	    end
	  end
	  
	  def team_requests
	  	if current_user.team.present? && current_user.id == current_user.team.owner_id
				team_requests = current_user.team.team_requests.count
			end
	  end
end
