class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "category_id", :dependent => :destroy
 belongs_to :parent, :class_name => "Category", :foreign_key => "category_id"
 
 has_many :products, :dependent => :restrict_with_error
end
