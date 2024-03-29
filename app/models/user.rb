class User < ApplicationRecord
  has_many :questions
  has_many :answers

  validates :provider, presence: true
  validates :uid, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /.+@.+\..+/, message: 'incorret email' }

  def self.find_or_create_from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.save!
    end
  end
end
