class Team < ActiveRecord::Base

	## Relations ##
	has_many :users
	has_many :team_requests

	### Validations ###
	validates :title, presence: true

end
