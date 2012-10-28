class AddRetailerslinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retail_link, :string
  end
end
