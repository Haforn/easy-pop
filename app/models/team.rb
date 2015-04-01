class Team < ActiveRecord::Base

	## Relations ##
	has_many :users

	### Validations ###
	validates :title, presence: true

end
