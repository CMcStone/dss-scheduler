class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :category_id
      t.text :description
      t.string :exchange_url
      t.integer :ou_uid
      t.integer :week_field
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :allow_anonymous

      t.timestamps
    end
  end
end
