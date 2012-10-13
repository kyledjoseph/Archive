class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :manufacturer_link
      t.string :dimensions
      t.string :weight
      t.string :price
      t.text :keywords

      t.timestamps
    end
  end
end
