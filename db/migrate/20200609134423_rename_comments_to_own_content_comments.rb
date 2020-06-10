class RenameCommentsToOwnContentComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :comments, :own_content_comments
  end
end
