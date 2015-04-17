class LearningGoalsController < ApplicationController 

	before_action :set_learning_goal, except: [:create]

	def create
		@learning_goal = LearningGoal.new(learning_goal_params)
		if @learning_goal.save
			redirect_to @learning_goal.competency, notice: 'Leerdoel is toegevoegd!'
		else
			redirect_to :back, alert: 'Oops, er ging iets mis!'
		end
	end

	def edit
	end

	def update
		if @learning_goal.update_attributes(learning_goal_params)
			redirect_to @learning_goal.competency, notice: 'Leerdoel is bewerkt!'
		else
			render 'edit', alert: 'Oops, er ging iets mis!'
		end
	end

	def destroy
		if @learning_goal.destroy
			redirect_to @learning_goal.competency, notice: 'Leerdoel is verwijderd!'
		else
			render @learning_goal, alert: 'Oops, er ging iets mis!'
		end
	end

	private

		## Set learning goal ##
		def set_learning_goal
			@learning_goal = LearningGoal.find(params[:id])
		end

		## Params ##
		def learning_goal_params
			params.require(:learning_goal).permit(:title, :achieved, :competency_id)
		end

end