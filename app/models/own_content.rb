class OwnContent < ApplicationRecord
  has_many :own_content_comments
  has_many :favourites, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true
  validates :published_date, presence: true
  validates :reading_time, presence: true
  validates :photo, presence: true
  validates :article, presence: true

  acts_as_votable
end
