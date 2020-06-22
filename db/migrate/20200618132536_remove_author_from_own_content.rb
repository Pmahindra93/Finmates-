class RemoveAuthorFromOwnContent < ActiveRecord::Migration[5.2]
  def change
    remove_column :own_contents, :author, :string
  end
end
