class OwnContentComment < ApplicationRecord
  belongs_to :user
  belongs_to :own_content
end
