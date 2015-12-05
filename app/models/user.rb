class User < ActiveRecord::Base
  after_create :default_profile
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
  has_many :hearts, dependent: :destroy
  has_one :profile

  def heart!(post)
    self.hearts.create!(post_id: post.id)
  end

  def unheart!(post)
    heart = self.hearts.find_by_post_id(post.id)
    heart.destroy!
  end

  def heart?(post)
    self.hearts.find_by_post_id(post.id)
  end

  private

  def default_profile
    self.create_profile
  end
end
