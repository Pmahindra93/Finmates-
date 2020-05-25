class AddThirdpartycontentToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :third_party_content, foreign_key: true
  end
end
