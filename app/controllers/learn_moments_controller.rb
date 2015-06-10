class LearnMomentsController < ApplicationController
	
	before_action :set_learn_moment, except: [:new, :create]
	before_action :set_competency
	before_action :set_arrays

	def show
	end

	def new
		@learn_moment = LearnMoment.new
	end

	def create
		@learn_moment = LearnMoment.new(learn_moment_params)
		if @learn_moment.save
			redirect_to @learn_moment.competency, notice: 'Leermoment is toegevoegd!'
		else
			render 'new', alert: 'Oops, er ging iets mis!'
		end
	end

	def edit
	end

	def update
		if @learn_moment.update_attributes(learn_moment_params)
			redirect_to @learn_moment, notice: 'Leermoment is bewerkt!'
		else 
			render 'edit', alert: 'Oops, er ging iets mis!'
		end
	end

	def destroy
		if @learn_moment.destroy
			redirect_to @learn_moment.competency, notice: 'Leermoment is verwijdert!'
		else
			render 'edit', alert: 'Oops, something went wrong!'
		end
	end

	private

		## Params ##
		def learn_moment_params
			params.require(:learn_moment).permit(:title, :what_was_learned, :what_was_done, :image, :refernce, :hours, :competency_id)
		end

		## Set learn_moment and competency ##
		def set_competency
			if params[:competency_id]
				@competency = Competency.find(params[:competency_id])
			elsif params[:learn_moment]
				@competency = Competency.find(params[:learn_moment][:competency_id])
			else
				@competency = @learn_moment.competency
			end
		end

		def set_learn_moment
			@learn_moment = LearnMoment.find(params[:id])
		end

		## Arrays ##
		def set_arrays
			@hours_list = [
				0,1,2,3,4,5,6,7,8
			]
		end

end