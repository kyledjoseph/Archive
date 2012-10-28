class AddStuffToComments < ActiveRecord::Migration
  def change
    add_column :comments, :link, :string
    add_column :comments, :content, :text
  end
end
