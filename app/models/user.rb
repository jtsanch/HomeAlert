class User < ActiveRecord::Base

	attr_accessor :password
	before_save :encrypt_password

	validates :login, uniqueness: true, on: :create
	validates :password, confirmation: true,  on: :create

	def encrypt_password 
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.password = BCrypt::Engine.hash_secret(password, self.salt)
		end
	end

	def self.authenticate(login, password)
		user = find_by_login(login)
		if user && user.password_hash == BCrypt::Engine.hash_secret( password, user.salt)
			user
		else
			nil
		end
	end
end
