class AddClassroomToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :classroom, :string
  end
end
