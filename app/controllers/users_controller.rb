class UsersController < ApplicationController 

	def show
		if current_user.team.present?
			@team_requests = current_user.team.team_requests.count
		end
	end

end