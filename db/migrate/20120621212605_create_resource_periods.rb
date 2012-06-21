class CreateResourcePeriods < ActiveRecord::Migration
  def change
    create_table :resource_periods do |t|
      t.integer :resource_id
      t.integer :length
      t.datetime :start_time
      t.integer :skip_duration

      t.timestamps
    end
  end
end
