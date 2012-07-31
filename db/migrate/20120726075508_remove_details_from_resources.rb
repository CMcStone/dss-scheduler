class RemoveDetailsFromResources < ActiveRecord::Migration
  def up
	remove_column :resources, :week_field
	remove_column :resources, :start_time
	remove_column :resources, :end_time
  end
  def down
  	add_column :resources, :week_field, :integer
	add_column :resources, :start_time, :datetime
	add_column :resources, :end_time, :datetime
  end
end
