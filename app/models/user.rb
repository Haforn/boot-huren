class User < ActiveRecord::Base

	has_secure_password

	has_many :boats
	has_many :my_favorites

	#validates_presence_of :password, :on => :create
	#validates_presence_of :password_confirmation
	#validates_confirmation_of :password

end