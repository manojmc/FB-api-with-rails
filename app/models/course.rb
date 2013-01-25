class Course < ActiveRecord::Base
  attr_accessible :name, :seats
  # has_and_belongs_to_many :users, :join_table => "users_courses"
  has_many :registrations
  has_many :users, :through => :registrations

  #returns all the wait  list students for a course
  def wait_list(course)
  	wl = course.registrations.where(:wl => true)
  	return wl
  end
end
