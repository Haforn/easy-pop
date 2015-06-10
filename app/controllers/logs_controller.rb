class LogsController < ApplicationController 

	before_action :set_arrays

	def index
		@logs = current_user.logs
		@log = Log.new
	end

	def create
		@log = Log.new(log_params.merge(user_id: current_user.id))
		if @log.save
			redirect_to logs_path, notice: "Log is toegevoegd!"
		else
			redirect_to logs_path, alert: "Oops, er ging iets mis!"
		end
	end

	def destroy
		@log = Log.find(params[:id])
		if @log.destroy
			redirect_to logs_path, notice: "Log is verwijdert!"
		else
			redirect_to logs_path, alert: "Oops, er ging iets mis!"
		end
	end

	private

		## Array ##
		def set_arrays
			@competency_list = [
				'Overig..',
				'Research and Innovation',
				'Concepting',
				'Multimedia Design',
				'Multimedia Production',
				'Quality Monitoring and Implementation',
				'Multidisciplinary Teamwork',
				'Communication',
				'Project Management',
				'Sharing',
				'Growth and Reflection'
			]

			@hours_list = [
				0,1,2,3,4,5,6,7,8
			]

		end

		## Params ##
		def log_params
			params.require(:log).permit(:title, :competency, :hours, :created_at)
		end

end