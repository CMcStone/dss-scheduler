class CreateResourceAvailabilities < ActiveRecord::Migration
  def change
    create_table :resource_availabilities do |t|
      t.datetime :start_time
      t.integer :length
      t.integer :resource_id
      t.integer :skip_duration

      t.timestamps
    end
  end
end
