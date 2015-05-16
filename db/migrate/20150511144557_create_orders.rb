class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.references :customer
      t.string :status
      t.text :notes

      t.timestamps null: false
    end
    add_index(:orders, :customer_id)
  end

  def down
      drop_table :orders
  end
end
