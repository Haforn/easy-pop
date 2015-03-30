class LearningGoal < ActiveRecord::Base

	## Relations ##
	belongs_to :competency

	### Validations ###
	validates :title, presence: true

end
