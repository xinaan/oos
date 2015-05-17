class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products
	
	
  validates_presence_of :name, :price, :category_id,  message: "cannot be empty"
  validates_uniqueness_of :name
  validates_numericality_of :price, message: "must be a number"
  
end
