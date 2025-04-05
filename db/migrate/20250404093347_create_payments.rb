class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
