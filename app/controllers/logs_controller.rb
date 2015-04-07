class LogsController < ApplicationController 

	before_action :set_arrays

	def index
		@logs = current_user.logs
		@log = Log.new
	end

	def create
		@log = Log.new(log_params.merge(user_id: current_user.id))
		if @log.save
			redirect_to logs_path, notice: "Your log is added"
		else
			redirect_to logs_path, alert: "Oops, something went wrong!"
		end
	end

	def destroy
		@log = Log.find(params[:id])
		if @log.destroy
			redirect_to logs_path, notice: "Your log is deleted"
		else
			redirect_to logs_path, alert: "Oops, something went wrong!"
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
				0.5,1,1.5,2,2.5,3,3.5,4,
				4.5,5,5.5,6,6.5,7,7.5,8
			]

		end

		## Params ##
		def log_params
			params.require(:log).permit(:title, :competency, :hours, :created_at)
		end

end