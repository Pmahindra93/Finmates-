class OwnContentComment < ApplicationRecord
  default_scope { order("created_at DESC") }

  belongs_to :own_content
  belongs_to :user
end
