class AddIndexToRetailersEmail < ActiveRecord::Migration
  def change
      add_index :retailers, :email, unique: true
  end
end
