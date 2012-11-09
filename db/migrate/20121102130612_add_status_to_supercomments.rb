class AddStatusToSupercomments < ActiveRecord::Migration
  def change
    add_column :supercomments, :status, :integer
  end
end
