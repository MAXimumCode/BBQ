require 'uri'

class User < ApplicationRecord
  has_many :events

  validates :name,
            presence: true, length: { maximum: 35 }
  validates :email,
            presence: true, length: { maximum: 255 }
  validates :email,
            uniqueness: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP }
end
