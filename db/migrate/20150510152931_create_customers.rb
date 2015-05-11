class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :first_name, limit: 45, null: false
      t.string :last_name, limit: 45
      t.date :dob
      t.boolean :gender , null:false
      t.string :email, null:false
      t.string :contact, limit: 10, null: false

      t.timestamps null: false
    end
  end

  def down

  end
end
