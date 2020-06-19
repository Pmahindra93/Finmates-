class AddAuthorToOwnContent < ActiveRecord::Migration[5.2]
  def change
    add_column :own_contents, :author, :string
  end
end
