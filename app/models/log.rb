class Log < ActiveRecord::Base

	## Relations ##
	belongs_to :user

	### Validations ###
	validates :title, presence: true

	## Methods ##
	def day  
		self.created_at.strftime('%d/%m/%Y')
	end

	def week  
		self.created_at.strftime('%W')
	end

end
