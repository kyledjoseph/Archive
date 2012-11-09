class AddVeribToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :veri, :boolean
  end
end
