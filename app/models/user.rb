require 'digest/sha1'

class User < ActiveRecord::Base

	belongs_to :employee
 attr_accessor :password
 
 before_save :create_hashed_password
 after_save :clear_password
 
 validates :username, :length => { :within => 5..25 }, :uniqueness => true
 validates :password, confirmation: true
 validates :password_confirmation, presence: true
 validates_length_of :password, :within => 5..25, :on => :create
 
 
 #attr_protected :hashed_password,:salt
 
  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end
  
  def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
		csv << column_names
		all.each do |users|
		  csv << users.attributes.values_at(*column_names)
		end
	  end
  end
 
 def self.make_salt(username="")
	Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
 end

 def self.hash_with_salt(password="", salt="")
	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
 end
 
 private
 
 def create_hashed_password
	unless password.blank?
		self.salt = User.make_salt(username) if salt.blank?
		self.hashed_password = User.hash_with_salt(password, salt)
	end
 end
 
 def clear_password
	self.password = nil
 end
 
end