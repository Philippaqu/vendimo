class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:facebook]
  monetize :balance_cents
  has_many :payments

  def self.find_for_facebook_oauth(data)
    email = data.info.email
    uid = data.uid

    user = User.where(email: email, uid: uid).first

    if user.nil?
      User.create({
        provider: "facebook",
        uid: uid,
        first_name: data.info.first_name,
        last_name: data.info.last_name,
        email: email,
        facebook_picture_url: data.info.image,
        password: Devise.friendly_token[0,20]
        })
    else
      user
    end
  end
end
