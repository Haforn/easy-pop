class AddNameStudentNumberMobileAndAvatarToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :student_number, :string
  	add_column :users, :mobile, :string
  	add_column :users, :avatar, :string
  end
end
