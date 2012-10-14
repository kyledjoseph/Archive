class RemoveItemRecallFromMyitems < ActiveRecord::Migration
  def up
    remove_column :myitems, :item_recall
  end

  def down
    add_column :myitems, :item_recall, :boolean
  end
end
