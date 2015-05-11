class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :contact
      t.string :email
      t.string :designation
      t.date :date_joined
      t.integer :role_id

      t.timestamps null: false
    end
    add_index(:employees, :first_name)
    add_index(:employees, :last_name)
    add_index(:employees, :role_id)
  end

  def down
    drop_table :employees
  end

end
