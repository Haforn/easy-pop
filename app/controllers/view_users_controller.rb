class ViewUsersController < ApplicationController

	before_action :set_view_user, only: [:show]
	before_action :set_arrays, only: [:show]

	private

		def set_view_user
			if params[:id]
				session[:view_user_id] = params[:id]
			end
		end

		## Arrays ##
		def set_arrays

			@hours_list = [
				0.5,1,1.5,2,2.5,3,3.5,4,
				4.5,5,5.5,6,6.5,7,7.5,8
			]
		
		end

end