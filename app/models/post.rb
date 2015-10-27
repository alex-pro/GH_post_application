class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 100 },
                    uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
