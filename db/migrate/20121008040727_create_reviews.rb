class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.integer :product_id
      t.text :content

      t.timestamps
    end
    add_index :reviews, :user_id
  end
end
