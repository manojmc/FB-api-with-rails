class AddWlToUsersCourses < ActiveRecord::Migration
  def change
    add_column :users_courses, :wl, :boolean, :default => false
    add_column :users_courses, :active, :boolean, :default => true
  end
end
