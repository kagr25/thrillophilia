class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :expire_date
      t.string :name
      t.integer :sku_id
      t.float :price

      t.timestamps null: false
    end
  end
end
