class RemoveRetailFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :retail
  end

  def down
    add_column :users, :retail, :boolean
  end
end
