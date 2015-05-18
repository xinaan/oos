class CreateDefaultUser < ActiveRecord::Migration
  def change
	create_default 
  end

  def self.create_default
	adminUser = User.new
	adminUser.username = "admin"
	adminUser.hashed_password = "26ce0f100f0bf653cc2e4fbf3592af83a1e86cdf"
	adminUser.salt = "97e3a6902f64c2bea217ef76014edc81c1227678"
	adminUser.save
  end
end
