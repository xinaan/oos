class ChangeUser < ActiveRecord::Migration
  def change
	add_column :users, :activation_code, :string
	add_column :users, :is_verified, :boolean, default: false
	add_column :users, :email, :string
	
	remove_column :employees, :email
	remove_column :customers, :email
	
  end
end
