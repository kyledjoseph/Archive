class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :user
      t.string :recipient
      t.integer :product_id

      t.timestamps
    end
    add_index :emails, :user_id
  end
end
