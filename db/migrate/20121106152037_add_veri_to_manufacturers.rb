class AddVeriToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :veri, :integer
  end
end
