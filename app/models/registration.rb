class Registration < ActiveRecord::Base
	set_table_name 'users_courses'
	attr_accessible :user_id, :wl, :active

	belongs_to :user
	belongs_to :course

	#Allows students to register for courses
	#Adds them to waiting list if no seats are available
	def add_to_waiting_list(user, course)
		#Checks for available seats and adds students to waiting list if seats are filled
		#Else registers them for the course
		course.users << user
		if course.seats <= course.users.count 
			registration = course.registrations.where(:user_id => u.id)
			registration.first.update_attribute(:wl, true)
		end
	end

	#remove a course from a student
	def delete_student(user, course)

		#remove the user course relation
		registration = course.registrations.where(:user_id => u.id)
		registration.first.update_attribute(:active, false)

		#update the first student in the waitlist
		wait_list = Course.wait_list(course)
		wait_list.first.update_attribute(:wl, false)
	end
end