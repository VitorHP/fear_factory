class User < ActiveRecord::Base
  include CanFavorite
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :trackable, 
         :omniauthable, omniauth_providers: [:facebook]

  has_many :characters
  has_many :campaigns
  has_many :custom_skill_groups
  has_many :house_rules

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.email    = auth.info.email
      user.save
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
