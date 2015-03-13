class BoatsController < ApplicationController 

	before_action :confirm_logged_in, :except => [:show, :index]
	before_action :set_boat, only: [:show, :edit, :update, :delete, :destroy]

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
			redirect_to boat_path(:id => @boat.id), notice: "Your boat has been added!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @boat.update_attributes(boat_params)
			redirect_to boat_path(:id => @boat.id), notice: "Your boat has been updated"
		else
			render 'edit'
		end
	end 

	def delete
	end

	def destroy
		@boat.destroy
		redirect_to boats_path, notice: "Your boat has been deleted" 
	end

	private

		def set_boat
			@boat = Boat.find(params[:id])
		end

		def boat_params 
		 	params.require(:boat).permit(:title)
		end

end 