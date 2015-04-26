class Feedback < ActiveRecord::Base

	## Relations ##
	belongs_to :user

	## Validations ##
	validates :body, presence: true

end
