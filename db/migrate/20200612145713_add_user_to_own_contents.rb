class AddUserToOwnContents < ActiveRecord::Migration[5.2]
  def change
    add_reference :own_contents, :user, foreign_key: true
  end
end
