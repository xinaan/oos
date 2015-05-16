class Customer < ActiveRecord::Base
  has_many :customer_addresses
  has_many :addresses, :through => :customer_addresses
  has_one :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
