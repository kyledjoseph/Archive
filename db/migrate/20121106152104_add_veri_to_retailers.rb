class AddVeriToRetailers < ActiveRecord::Migration
  def change
    add_column :retailers, :veri, :integer
  end
end
