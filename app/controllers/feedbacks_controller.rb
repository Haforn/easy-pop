class FeedbacksController < ApplicationController

	def new
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.create!(feedback_params.merge(user_id: current_user.id))
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	private 

		def feedback_params
			params.require(:feedback).permit(:title, :body)
		end

end