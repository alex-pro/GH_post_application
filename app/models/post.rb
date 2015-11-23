# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  tags       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 140 },
                    uniqueness: true
  validates :body, presence: true,
                    length: { minimum: 140 }
  validates :user, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :hearts, dependent: :destroy
end
