class RemoveVeriFromManufacturers < ActiveRecord::Migration
  def up
    remove_column :manufacturers, :veri
  end

  def down
    add_column :manufacturers, :veri, :integer
  end
end
