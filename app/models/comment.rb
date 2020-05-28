class Comment < ApplicationRecord
  belongs_to :own_content
  belongs_to :third_party_content
end
