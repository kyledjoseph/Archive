class AddCollectionToMyitems < ActiveRecord::Migration
  def change
    add_column :myitems, :collection, :string
  end
end
