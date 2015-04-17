class TeamMembersController < ApplicationController

	def add
		@user = User.find(params[:member_id])
		if @user.update_attributes(team_id: params[:team_id])
			TeamRequest.find_by(team_id: params[:team_id], user_id: @user.id).destroy
			redirect_to team_path, notice: 'Teamlid is toegevoegd aan jouw team!'
		else
			redirect_to team_path, alert: 'Oops, er ging iets mis!'
		end
	end

	def remove
		if TeamRequest.find(params[:request_id]).destroy
			redirect_to team_path, notice: 'Verzoek is verwijdert!'
		else
			render 'teams#show', alert: 'Oops, er ging iets mis!'
		end
	end

	def join
		team_request = TeamRequest.new(team_id: params[:team_id], user_id: current_user.id)
		if team_request.save
			redirect_to teams_path, notice: 'Jouw verzoek is verstuurd!'
		else
			render 'teams#index', alert: 'Oops, er ging iets mis!'		
		end
	end

	def undo
		team_request = TeamRequest.find_by(:user_id => current_user.id, :team_id => params[:team_id])
		if team_request.destroy
			redirect_to teams_path, notice: 'Jouw verzoek is ongedaan gemaakt!'
		else
			render 'teams#index', alert: 'Oops, er ging iets mis!'
		end
	end

	def leave_team
		if current_user.update_attributes(:team_id => nil)
			redirect_to teams_path, notice: 'Je hebt je team verlaten!'
		else
			render 'teams#index', alert: 'Oops, er ging iets mis!'
		end
	end

end