class EducationContent < ApplicationRecord
  has_one_attached :thumbnail
  has_many_attached :photos
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :content, presence: true
end
