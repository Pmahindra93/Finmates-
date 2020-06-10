class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites
  has_many :own_content_comments

  # has_one_attached :picture

  # validates :email, uniqueness: true
  # validates :email, presence: true
  # validates :name, presence: true

  acts_as_voter
end
