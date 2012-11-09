class AddRetailToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :retail, :boolean
  end
end
