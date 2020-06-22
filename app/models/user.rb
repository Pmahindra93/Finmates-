class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :favourites
  has_many :own_content_comments
  has_many :own_contents

  acts_as_voter

  # validates :email, uniqueness: true
  # validates :email, presence: true
  # validates :name, presence: true

  # Avatar
  has_one_attached :avatar

end
