class CompetenciesController < ApplicationController

	before_action :set_competency_title

	def index
		@competencies = current_user.competencies
	end

	private

		def set_competency_title
			@competency_list = [
				"Research and Innovation",
				"Concepting",
				"Multimedia Design",
				"Multimedia Production"
			]
		end

end