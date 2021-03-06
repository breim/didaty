class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :name, presence: true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.email = auth.info.email.nil? ? "#{SecureRandom.hex(5)}@mail.com" : auth.info.email
        #user.image = auth.info.image
      end
  end

end
