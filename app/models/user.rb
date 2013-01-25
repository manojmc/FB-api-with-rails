class User < ActiveRecord::Base
  # has_and_belongs_to_many :courses, :join_table => "users_courses"
  has_many :registrations
  has_many :courses, :through => :registrations
  # belongs_to :course

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.image = auth.info.image
      user.save!
    end
  end

  #Interacts with the API
  def facebook 
  	@facebook ||= Koala::Facebook::API.new(oauth_token)

  	return @facebook
  	# friends = @facebook.get_connections("me", "friends")

  end
end
