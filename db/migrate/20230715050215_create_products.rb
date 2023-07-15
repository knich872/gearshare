class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :photos
      t.float :rental_price_day
      t.integer :caterogy

      t.timestamps
    end
  end
end
