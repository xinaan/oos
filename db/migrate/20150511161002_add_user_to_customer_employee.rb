class AddUserToCustomerEmployee < ActiveRecord::Migration
  def change
    add_column(:customers, :user_id, :integer)
    add_column(:employees, :user_id, :integer)
  end
end
