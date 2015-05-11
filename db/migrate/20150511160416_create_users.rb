class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt

      t.timestamps null: false
    end
    add_index(:users,:username)
  end

  def down
    drop_table :users
  end
end
