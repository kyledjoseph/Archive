class RemoveRetailinkFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :retail_link
  end

  def down
    add_column :products, :retail_link, :string
  end
end
