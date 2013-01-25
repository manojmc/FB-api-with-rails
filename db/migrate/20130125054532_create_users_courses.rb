class CreateUsersCourses < ActiveRecord::Migration
  def up
  	create_table :users_courses do |t|
  		t.integer :user_id
  		t.integer :course_id
  	end

  add_index :users_courses, :user_id
  add_index :users_courses, :course_id

  remove_column :users, :courses
  end

  def down
  	add_column :users, :courses, :string

  	drop_table :users_courses
  	
  end
end
