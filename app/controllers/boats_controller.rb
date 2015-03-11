class BoatsController < ApplicationController 

	before_action :set_boat, only: [:show]

	def index
		@boats = Boat.all
	end

	def show
	end 

	def new
		@boat = Boat.new
	end

	def create
		@boat = Boat.new(boat_params)
		if @boat.save
			redirect_to boat_path(:id => @boat.id), notice: "Uw boat is toegevoegd!"
		else
			render 'new'
		end
	end

	private

		def set_boat
			@boat = Boat.find(params[:id])
		end

		def boat_params 
		 	params.require(:boat).permit(:title)
		end

end 