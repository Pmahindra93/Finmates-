class ThirdPartyContent < ApplicationRecord
  has_many :own_content_comments
  has_many :favourites
end
