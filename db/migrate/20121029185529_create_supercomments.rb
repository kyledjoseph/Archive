class CreateSupercomments < ActiveRecord::Migration
  def change
    create_table :supercomments do |t|
      t.integer :manufacturer_id
      t.integer :retailer_id
      t.text :content
      t.string :link

      t.timestamps
    end
  end
end
