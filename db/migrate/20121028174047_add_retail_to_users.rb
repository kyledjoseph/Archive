class AddRetailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :retail, :boolean
  end
end
