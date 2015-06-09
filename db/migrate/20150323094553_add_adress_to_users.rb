class AddAdressToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :zip_code, :string
  	add_column :users, :residence, :string
  	add_column :users, :street, :string
  	add_column :users, :house_number, :integer
  end
end
