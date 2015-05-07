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
		#respond_to do |format|
		#	format.html { redirect_to @learning_goal.competency }
		#	format.js
		#end
	end

	def delete

	end

	def destroy
		@learning_goal.destroy


		#if @learning_goal.destroy
		#	redirect_to @learning_goal.competency, notice: 'Leerdoel is verwijderd!'
		#else
		#	render @learning_goal, alert: 'Oops, er ging iets mis!'
		#end
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