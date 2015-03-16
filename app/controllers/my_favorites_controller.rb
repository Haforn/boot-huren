class MyFavoritesController < ApplicationController

	def new
		@my_favorite = MyFavorite.new
	end

	def create
		@my_favorite = MyFavorite.new(my_favorite_params)
		@my_favorite.save
	end

	private

		def my_favorite_params
			params.require(:my_favorite).permit().merge(user_id: @current_user.id, boat_id: @boat.id)
		end

end