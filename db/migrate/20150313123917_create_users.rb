class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "name", :limit => 80
     	t.string "username", :limit => 50
    	t.string "email", :default => "", :null => false
    	t.string "password", :limit => 40
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
