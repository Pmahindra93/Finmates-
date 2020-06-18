class Didyouknow < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :article, presence: true
  validates :published_date, presence: true

  has_one_attached :image
  belongs_to :user

end
