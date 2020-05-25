class AddThirdpartycontentToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favourites, :third_party_content, foreign_key: true
  end
end
