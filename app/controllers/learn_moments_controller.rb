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
			@hour_list = [
				[0.50,1],[1,2],
				[1.50,3],[2,4],
				[2.50,5],[3,6],
				[3.50,7],[4,8],
				[4.50,9],[5,10],
				[5.50,11],[6,12],
				[6.50,13],[7,14],
				[7.50,15],[8,16]
			]

			@hour_list_show = [
				0.5,1,1.5,2,2.5,3,3.5,4,
				4.5,5,5.5,6,6.5,7,7.5,8
			]
		end

end