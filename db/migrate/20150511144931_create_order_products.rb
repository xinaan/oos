class CreateOrderProducts < ActiveRecord::Migration
  def up
    create_table :order_products do |t|
      t.references :order
      t.references :product
      t.integer :units
      t.decimal :price
      t.timestamps null: false
    end

    add_index(:order_products, :order_id)
    add_index(:order_products,:product_id)
  end


  def down

    drop_table :order_products
  end
end
