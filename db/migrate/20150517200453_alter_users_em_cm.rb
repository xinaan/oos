class AlterUsersEmCm < ActiveRecord::Migration
  def change
	add_column :employees, :gender, :boolean
	add_column :users, :employee_id, :integer
	add_column :users, :customer_id, :integer
	remove_column :employees, :user_id
	remove_column :customers, :user_id
  end
end
