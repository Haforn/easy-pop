class LearnMoment < ActiveRecord::Base

	## Relations ##
	belongs_to :competency

	### Validations ###
	validates :title, presence: true

	## Image uploader ##
  mount_uploader :image, ImageUploader

end
