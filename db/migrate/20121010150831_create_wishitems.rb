class CreateWishitems < ActiveRecord::Migration
  def change
    create_table :wishitems do |t|
      t.references :user
      t.integer :product_id

      t.timestamps
    end
    add_index :wishitems, :user_id
  end
end
