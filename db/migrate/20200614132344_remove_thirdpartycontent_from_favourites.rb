class RemoveThirdpartycontentFromFavourites < ActiveRecord::Migration[5.2]
  def change
    remove_reference :favourites, :third_party_content, foreign_key: true
  end
end
