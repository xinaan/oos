class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string  :name , null: false
      t.text  :description
      t.integer  :category_id, null: false
      t.string :size
      t.decimal :price, null: false
      t.boolean :visible
      t.string :image_link
      t.timestamps null: false
    end
    add_index(:products,:name)
    add_index(:products, :category_id)
  end

  def down
    drop_table :products
  end
end
