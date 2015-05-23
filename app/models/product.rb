class Product < ActiveRecord::Base
	belongs_to :category
	has_many :order_products
	has_many :orders, through: :order_products
	
	has_attached_file :image,
	:url => "/assets/products/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
	
	validates_presence_of :name, :price, :category_id,  message: "cannot be empty"
	validates_uniqueness_of :name
	validates_numericality_of :price, message: "must be a number"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/bmp"] 
	validates_attachment_size :image, :less_than => 2.megabytes
	scope :active, ->{ where(visible: true) }	
	scope :in_active, ->{ where(visible: false) }
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
	def invisible
		if visible == false 
			self.visible = true
		else
			self.visible = false
		end
	end



end
