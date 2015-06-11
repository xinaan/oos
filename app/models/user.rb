require 'digest/sha1'

class User < ActiveRecord::Base

	belongs_to :employee
 attr_accessor :password
 
 before_save :create_hashed_password
 after_save :clear_password


 validates_format_of :username, with: /\A[a-zA-Z0-9]+\z/
 validates :username, :length => { :within => 5..25 }, :uniqueness => true
 
 validates :password, confirmation: true
 validates :password_confirmation, presence: true
 validates :email, presence: true, :uniqueness => true
 validates_length_of :password, :within => 5..25, :on => :create
 
 #attr_protected :hashed_password,:salt
  def self.is_customer(id="")
	user = User.find(id)
	unless user.customer_id.nil?
		true
	else
		false
	end
  end
  
  def self.authenticate(username="", password="")
    user = User.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  def self.verify(id="", code="")
    user = User.find(id)
    if user && user.code_match?(code,user.activation_code)
      return user
    else
      return false
    end
  end

  def active
    self.is_verified= true 
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end

  def code_match?(code="",act_code="")
    code == act_code
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
 
 def self.acode(username="")
	code = Digest::SHA1.hexdigest("Use #{username} with #{Time.now} as activation code")
	code = code.at(1..9)
	code
 end

 private
 
 def create_hashed_password
	unless password.blank?
		self.salt = User.make_salt(username) if salt.blank?
		self.hashed_password = User.hash_with_salt(password, salt)
		self.activation_code = User.acode(username)
	end
 end
  
 def clear_password
	self.password = nil
 end
 
end