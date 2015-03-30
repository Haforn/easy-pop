class CompetenciesController < ApplicationController

	before_action :set_arrays, except: [:index]
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
			redirect_to @competency, notice: 'Your new competency is added'
		else
			render 'new', alert: 'Oops, something went wrong!'
		end
	end

	def edit
	end

	def update
		if @competency.update_attributes(competency_params)
			redirect_to @competency, notice: 'Competency is updated'
		else
			render 'edit', alert: 'Oops, something went wrong!'
		end
	end

	def destroy
		if @competency.destroy
			redirect_to competencies_path, notice: 'Competency is destroyed'
		else
			render 'edit', alert: 'Oops, something went wrong!'
		end
	end


	private

		## Array ##
		def set_arrays
			@competency_list = [
				'Research and Innovation',
				'Concepting',
				'Multimedia Design',
				'Multimedia Production' 
			]

			@expertise_list = [
				'Basic',
				'Advanced',
				'Expert'
			]

			@points_list = [3,6,9,12,15,18,21,24,27,30]

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