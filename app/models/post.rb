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
                    length: { minimum: 5, maximum: 100 },
                    uniqueness: true
  validates :body, presence: true

  belongs_to :user
end
