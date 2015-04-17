class TeamsController < ApplicationController

	def index
		if current_user.team_id != nil
			redirect_to team_path(current_user.team_id), notice: 'You are already in a team'
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
				redirect_to team_path(current_user.team_id), notice: 'Jouw team is aangemaakt!'
			else
				render 'index', alert: 'Oops, er ging iets mis!'
			end
		else
			render 'index', alert: 'Oops, er ging iets mis!'
		end
	end

	def update
		@team = Team.find(current_user.team_id)
		if @team.update_attributes(team_params)
			redirect_to team_path(current_user.team_id), notice: 'Dit is jouw nieuwe team!'
		else
			render 'show', alert: 'Oops, er ging iets mis!'
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
				redirect_to teams_path, notice: 'Je Team is verwijderd!'
			else
				render 'show', alert: 'Jouw is team niet verwijdert!'
			end
		else
			render 'index', alert: 'Oops, er ging iets mis!'
		end
	end

	private

		def team_params
			params.require(:team).permit(:title)
		end

end