class Competency < ActiveRecord::Base

	## Relations ##
	belongs_to :user
	has_many :learning_goals, dependent: :destroy
	has_many :learn_moments, dependent: :destroy

end
