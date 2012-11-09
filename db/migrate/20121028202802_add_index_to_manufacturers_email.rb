class AddIndexToManufacturersEmail < ActiveRecord::Migration
  def change
      add_index :manufacturers, :email, unique: true
  end
end
