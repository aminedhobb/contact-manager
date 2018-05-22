class RemoveTagFromContact < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :tag
  end
end
