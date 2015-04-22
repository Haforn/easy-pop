class Feedback < ActiveRecord::Base

	## Relations ##
	belongs_to :user

	## Validations ##
	validates :title, presence: true

end
