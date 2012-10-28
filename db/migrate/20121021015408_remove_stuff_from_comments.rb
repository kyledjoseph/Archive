class RemoveStuffFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :content
    remove_column :comments, :link
  end

  def down
    add_column :comments, :link, :text
    add_column :comments, :content, :string
  end
end
