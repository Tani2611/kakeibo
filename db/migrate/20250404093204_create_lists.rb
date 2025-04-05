class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :price
      t.integer :payment_id
      t.integer :category_id

      t.timestamps
    end
  end
end
