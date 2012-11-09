class AddRememberTokenToManufacturers < ActiveRecord::Migration
  def change
      add_column :manufacturers, :remember_token, :string
      add_index  :manufacturers, :remember_token
  end
end
