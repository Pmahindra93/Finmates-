class ThirdPartyContent < ApplicationRecord
  has_many :comments
  has_many :favourites
end
