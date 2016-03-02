class User < ActiveRecord::Base

	has_secure_password
	
	has_many :educations
	has_many :employments
	has_many :skilltypes
	has_many :languages
	has_many :interests

end
