class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
    	t.string :title
      t.timestamps null: false
    end
  end
end
