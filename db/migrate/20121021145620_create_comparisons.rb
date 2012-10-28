class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.references :user
      t.integer :product_id

      t.timestamps
    end
    add_index :comparisons, :user_id
  end
end
