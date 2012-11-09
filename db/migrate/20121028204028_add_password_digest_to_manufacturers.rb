class AddPasswordDigestToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :password_digest, :string
  end
end
