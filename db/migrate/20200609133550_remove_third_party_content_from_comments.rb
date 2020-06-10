class RemoveThirdPartyContentFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :third_party_content, foreign_key: true
  end
end
