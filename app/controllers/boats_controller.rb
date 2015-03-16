class BoatsController < ApplicationController

	before_action :confirm_logged_in, except: [:show, :index]
	before_action :set_boat, except: [:index, :my_boats, :new, :create]
	before_action :check_if_owner, only: [:edit, :update, :delete, :destroy]

	def index
		@boats = Boat.all
		
		# Getting back my favorite boats
		@my_favorites = MyFavorite.where(:user_id => @current_user.id)

		@my_favorite_array = Array.new

		@my_favorites.each do |my_favorite|
			@my_favorite_array << my_favorite.boat_id
		end

		@my_favorite_boats = Boat.find(@my_favorite_array)

	end

	def my_boats
		@my_boats = Boat.where(:user_id => @current_user.id)
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
			params.require(:boat).permit(:title).merge(user_id: @current_user.id)
		end

		def check_if_owner
			if @current_user.id != @boat.user_id
				redirect_to my_boats_path, notice: "Only edit your own boats"
			end
		end

end