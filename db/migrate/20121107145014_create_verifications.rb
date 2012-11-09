class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.integer :manufacturer_id
      t.integer :retailer_id
      t.integer :status

      t.timestamps
    end
  end
end
