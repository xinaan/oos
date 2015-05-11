class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.string :name , null: false
      t.string :street
      t.string :island, default: "Hithadhoo"
      t.string :atoll, default: "Addu City"
      t.timestamps null: false
    end
    add_index(:addresses, :name)
  end

  def down
    drop_table :addresses
  end
end
