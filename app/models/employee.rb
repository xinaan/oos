class Employee < ActiveRecord::Base
  belongs_to :role
  has_one :user, :dependent => :destroy
  accepts_nested_attributes_for :user
end
