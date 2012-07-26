class RemoveResourcePeriod < ActiveRecord::Migration
  def up
	drop_table :resource_periods
  end

  def down
	create_table :resource_periods do |t|
      t.integer :resource_id
      t.integer :length
      t.datetime :start_time
      t.integer :skip_duration

      t.timestamps
	 end
	end
end
