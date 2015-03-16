class CreateMyFavorites < ActiveRecord::Migration
  def change
    create_table :my_favorites do |t|
    	t.integer :user_id
    	t.integer :boat_id
      t.datetime :added_at
    end
  end
end
