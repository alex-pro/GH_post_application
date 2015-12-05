class Profile < ActiveRecord::Base
  after_create :set_avatar
  belongs_to :user

  COUNTRIES = [['Ukraine', 'Ukraine'], ['Russian', 'Russian'], ['USA', 'USA'], ['Japan', 'Japan'], ['China', 'China'], ['Kazakhstan', 'Kazakhstan'], ['Poland', 'Poland'], ['Korea', 'Korea'], ['Canada', 'Canada'], ['Mexico', 'Mexico']]
  SEX = [['Man', 'Man'], ['Woman', 'Woman']]

  private

  def set_avatar
    self.avatar = Gravatar.new("generic@example.com").image_url unless self.avatar
  end
end
