class Favourite < ApplicationRecord
  belongs_to :own_content
  belongs_to :user

   validates :user_id, uniqueness: {
    scope: [:own_content_id],
    message: 'can only favorite an item once'
  }
end
