class TeamsController < ApplicationController

	def index
		if current_user.team_id != nil
			redirect_to team_path(current_user.team_id), notice: "You are already in a team"
		end

		@teams = Team.all
		@team = Team.new

	end

	def show
		@team = Team.find(current_user.team_id)
		@team_members = @team.users

		@team_requests = @team.team_requests
	end

	def create
		@team = Team.new(team_params.merge(owner_id: current_user.id))
		if @team.save
			if current_user.update_attributes(team_id: @team.id)
				redirect_to team_path(current_user.team_id), notice: "This is your new team"
			else
				render 'index', alert: "Oops, something went wrong!"
			end
		else
			render 'index', alert: "Oops, something went wrong!"
		end
	end

	def update
		@team = Team.find(current_user.team_id)
		if @team.update_attributes(team_params)
			redirect_to team_path(current_user.team_id), notice: "This is your new team"
		else
			render 'show', alert: "Oops, something went wrong!"
		end 
	end

	def destroy
		@team = Team.find(current_user.team_id)
		if @team.owner_id == current_user.id
			if @team.destroy
				team_members = @team.users
				team_members.each do |member|
					member.update_attributes(team_id: nil)
				end
				redirect_to teams_path, notice: "Your team is deleted, join a differend team!"
			else
				render 'show', alert: "Couldn't delete the team"
			end
		else
			render 'index', alert: "Oops, something went wrong!"
		end
	end

	private

		def team_params
			params.require(:team).permit(:title)
		end

end