class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :favourites, dependent: :destroy
  has_many :own_content_comments, dependent: :destroy
  has_many :own_contents, dependent: :destroy
  has_many :education_contents, dependent: :destroy

  acts_as_voter

  validates :nickname, uniqueness: true
  validates :email, :first_name, :last_name, presence: true

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
    # user_params = auth.slice("provider", "uid")
    # user_params.merge! auth.info.slice("email", "first_name", "last_name")
    # user_params[:facebook_picture_url] = auth.info.image
    # user_params[:token] = auth.credentials.token
    # user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    # user_params = user_params.to_h

    # user = User.find_by(provider: auth.provider, uid: auth.uid)
    # user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    # if user
    #   user.update(user_params)
    # else
    #   user = User.new(user_params)
    #   user.password = Devise.friendly_token[0,20]  # Fake password for validation
    #   user.save
    # end

    # return user
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    # user.email = auth.info.email
    # user.password = Devise.friendly_token[0, 20]
    # user.name = auth.info.name   # assuming the user model has a name
    # user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name   # assuming the user model has a name
    user.facebook_picture_url = auth.info.image # assuming the user model has an image

    user.save
    user.skip_confirmation!
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
