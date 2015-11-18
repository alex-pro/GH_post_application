class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password

  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  validates :password, length: { minimum: 6 }
  validates_presence_of :name

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
