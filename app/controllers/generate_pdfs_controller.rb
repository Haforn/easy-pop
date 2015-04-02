class GeneratePdfsController < ApplicationController 
	
	#layout 'generate_pdf'

	before_action :set_arrays

	def index
		respond_to do |format|
      format.html
      current_user
      format.pdf do
        render :pdf => "Pop", :template => 'generate_pdfs/index.html.erb', :layout => 'layouts/pdf.html.erb'
      end
    end 
	end

	private

		## Array ##
		def set_arrays
			@competency_list = [
				'Research and Innovation',
				'Concepting',
				'Multimedia Design',
				'Multimedia Production' 
			]

			@expertise_list = [
				'Basic',
				'Advanced',
				'Expert'
			]

			@points_list = [3,6,9,12,15,18,21,24,27,30]

			@hours_list = [
				0.5,1,1.5,2,2.5,3,3.5,4,
				4.5,5,5.5,6,6.5,7,7.5,8
			]
		end

end