class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "category_id", :dependent => :destroy
 belongs_to :parent, :class_name => "Category", :foreign_key => "category_id"
 
 has_many :products, :dependent => :restrict_with_error
 
 validates_presence_of :name
 validates_uniqueness_of :name
 
 scope :main, lambda {where category_id: nil}
 
 
end
