class LearningGoalsController < ApplicationController 

	before_action :set_learning_goal, except: [:create]

	def new
		@learning_goal = LearningGoal.new
	end

	def create
		@learning_goal = LearningGoal.create!(learning_goal_params)
		respond_to do |format|
			format.html { redirect_to @learning_goal.competency, notice: 'successfully updated.' }
			format.js
		end
	end

	def edit
	end

	def update
		@learning_goal.update_attributes(learning_goal_params);
	end

	def delete
	end

	def destroy
		if @learning_goal.destroy
			redirect_to @learning_goal.competency, notice: 'Leerdoel is verwijdert!'
		else
			render 'edit', alert: 'Oops, something went wrong!'
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