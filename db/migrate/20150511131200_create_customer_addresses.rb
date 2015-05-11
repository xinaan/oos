class CreateCustomerAddresses < ActiveRecord::Migration
  def up
    create_table :customer_addresses do |t|
      t.references :customer
      t.references :address
      t.boolean :primary, default: false
      t.timestamps null: false
    end

    add_index(:customer_addresses, :customer_id )
    add_index(:customer_addresses, :address_id)
  end

  def down
    drop_table :customer_addresses
  end
end
