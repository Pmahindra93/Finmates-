class OwnContent < ApplicationRecord
  has_many :own_content_comments
  has_many :favourites
  has_one_attached :own_content_thumb
  belongs_to :user

  acts_as_votable
end
