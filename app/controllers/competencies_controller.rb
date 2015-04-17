class CompetenciesController < ApplicationController

	before_action :set_arrays
	before_action :find_competency, except: [:index, :new, :create]

	def index
		@competencies = current_user.competencies
	end

	def show
		@learning_goal = LearningGoal.new
	end 

	def new
		@competency = Competency.new
	end

	def create
		@competency = Competency.new(competency_params.merge(user_id: current_user.id))
		if @competency.save
			redirect_to @competency, notice: 'Competencie is toegevoegd!'
		else
			render 'new', alert: 'Oops, er ging iets mis!'
		end
	end

	def edit
	end

	def update
		if @competency.update_attributes(competency_params)
			redirect_to @competency, notice: 'Competencie is bewerkt!'
		else
			render 'edit', alert: 'Oops, er ging iets mis!'
		end
	end

	def destroy
		if @competency.destroy
			redirect_to competencies_path, notice: 'Competencie is verwijderd!'
		else
			render 'edit', alert: 'Oops, er ging iets mis!'
		end
	end


	private

		## Array ##
		def set_arrays
			@competency_list = [
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

			@expertise_list = [
				'basis',
				'gevorderd',
				'expert'
			]

			@points_list = [3,6,9,12,15,18,21,24,27,30]

			@hours_list = [
				0.5,1,1.5,2,2.5,3,3.5,4,
				4.5,5,5.5,6,6.5,7,7.5,8
			]
		end

		## Find the competency ##
		def find_competency
			@competency = Competency.find(params[:id])
		end

		## Params ##
		def competency_params
				params.require(:competency).permit(:title, :added, :expertise, :points)
		end

end