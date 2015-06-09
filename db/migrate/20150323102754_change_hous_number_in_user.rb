class ChangeHousNumberInUser < ActiveRecord::Migration
  def up
  	change_column :users, :house_number, :string
  end

  def down
  	change_column :users, :house_number, :integer
  end
end
