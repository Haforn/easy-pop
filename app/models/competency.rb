class Competency < ActiveRecord::Base

	## Relations ##
	belongs_to :user
	has_many :learning_goals
	has_many :learn_moments

end
