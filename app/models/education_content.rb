class EducationContent < ApplicationRecord
  has_one_attached :thumbnail
  # has_many_attached :photos
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :edu_content, presence: true

  acts_as_votable

  searchkick #:text_middle [:title]

  def search_data
    {
      title: title,
    }
  end
end
