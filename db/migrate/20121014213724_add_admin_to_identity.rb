class AddAdminToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :admin, :boolean
  end
end
