class OwnContent < ApplicationRecord
  has_many :comments
  has_many :favourites
  has_one_attached :own_content_thumb
end
