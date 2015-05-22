class Employee < ActiveRecord::Base
  belongs_to :role
  has_one :user, :dependent => :destroy
  accepts_nested_attributes_for :user
  
  validates_presence_of :first_name, :last_name, :contact, :dob
  validates_uniqueness_of :contact
  validates_format_of :contact, with: /[7,9]{1}[0-9]{6}/, message: "must start with 7 or 9"
  validates_length_of :contact, minimm: 7, maximum: 7, message: "must have 7 digits"
  validates_exclusion_of :dob, :in => 18.years.ago..Time.now

  
	def fullname
		"#{first_name} #{last_name}"
	end
	
end
