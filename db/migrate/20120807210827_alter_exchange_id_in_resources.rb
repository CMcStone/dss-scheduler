class AlterExchangeIdInResources < ActiveRecord::Migration
  def up
	remove_column :resources, :exchange_url
	add_column :resources, :exchange_calendar_id, :integer
  end

  def down
	add_column :resources, :exchange_url, :string
	remove_column :resources, :exchange_calendar_id
 
  end
end
