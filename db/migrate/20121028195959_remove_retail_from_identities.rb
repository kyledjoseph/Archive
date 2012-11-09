class RemoveRetailFromIdentities < ActiveRecord::Migration
  def up
    remove_column :identities, :retail
  end

  def down
    add_column :identities, :retail, :boolean
  end
end
