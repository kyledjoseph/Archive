class AddManuandretToProducts < ActiveRecord::Migration
  def change
    add_column :products, :manufacturer_id, :integer
    add_column :products, :retailer_id, :integer
  end
end
