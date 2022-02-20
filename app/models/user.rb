class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(access_token)
    user = User.where(email: access_token.info.email).first

    user ||= User.create(
      name: access_token.info.name,
      email: access_token.info.email,
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
