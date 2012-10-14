class AddItemRecallToMyitems < ActiveRecord::Migration
  def change
    add_column :myitems, :item_recall, :string
  end
end
