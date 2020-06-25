class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :favourites
  has_many :own_content_comments, dependent: :destroy
  has_many :own_contents, dependent: :destroy

  acts_as_voter

  # validates :email, uniqueness: true
  # validates :email, presence: true
  # validates :name, presence: true

  # Avatar
  has_one_attached :avatar

  #this tells Carrierwave to use the image attribute in the
  #model to store the file reference
  mount_uploader :image, ImageUploader

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_initialize do |user|
      user.remote_picture_url = provider_data.info.image
      user.username = provider_data.info.name
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.oauth_token = provider_data.credentials.token
      user.oauth_expires_at = provider_data.credentials.expires_at
      user.save!
    end
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
