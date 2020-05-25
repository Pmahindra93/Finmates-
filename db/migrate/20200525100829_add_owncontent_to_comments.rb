class AddOwncontentToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :own_content, foreign_key: true
  end
end
