class Favourite < ApplicationRecord
  belongs_to :own_content
  belongs_to :user
end
