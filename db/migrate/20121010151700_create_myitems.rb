class CreateMyitems < ActiveRecord::Migration
  def change
    create_table :myitems do |t|
      t.references :user
      t.integer :product_id
      t.string :price
      t.text :purchase_proof
      t.string :current_value
      t.string :purchase_date
      t.text :location_of_manual
      t.string :resale_value
      t.string :rental_value
      t.text :repair_locations
      t.boolean :item_recall
      t.text :extra_notes

      t.timestamps
    end
    add_index :myitems, :user_id
  end
end
