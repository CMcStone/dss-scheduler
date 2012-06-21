class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :resource_id
      t.integer :person_id
      t.string :exchange_event_id
      t.datetime :cache_start_time
      t.datetime :cache_end_time
      t.integer :recurrence_id
      t.integer :questionnaire_response_id
      t.integer :package_id

      t.timestamps
    end
  end
end
