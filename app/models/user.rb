class User < ActiveRecord::Base

	has_secure_password

	has_many :boats
	has_many :my_favorites

	# validates
	EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\Z/i
	
	validates :email, 		:presence => true, 
							:length => { :maximum => 50 },
							:format => { :with => EMAIL_REGEX }
	
	validates :username, 	:presence => true, 
							:length => { :within => 6..25 }, 
							:uniqueness => true

	validates :password, :length => { :within => 4..25 }, confirmation: true

end