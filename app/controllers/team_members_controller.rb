class TeamMembersController < ApplicationController

	def add
		@user = User.find(params[:member_id])
		if @user.update_attributes(team_id: params[:team_id])
			TeamRequest.find_by(team_id: params[:team_id], user_id: @user.id).destroy
			redirect_to team_path, notice: "Team member is added to your team!"
		else
			redirect_to team_path, alert: "Oops, something went wrong!"
		end
	end

	def remove
		if TeamRequest.find(params[:request_id]).destroy
			redirect_to team_path, notice: "Request has been deleted!"
		else
			render 'teams#show', alert: "Oops, something went wrong!"
		end
	end

	def join
		team_request = TeamRequest.new(team_id: params[:team_id], user_id: current_user.id)
		if team_request.save
			redirect_to teams_path, notice: "Your request has been send, wait for a respons"
		else
			render 'teams#index', alert: "Oops, something went wrong!"		
		end
	end

	def undo
		team_request = TeamRequest.find_by(:user_id => current_user.id, :team_id => params[:team_id])
		if team_request.destroy
			redirect_to teams_path, notice: "Your request has been undone!"
		else
			render 'teams#index', alert: "Oops, something went wrong!"
		end
	end

end