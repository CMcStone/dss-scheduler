class AddSyncStateToResource < ActiveRecord::Migration
  def change
  add_column :resources, :sync_state, :string
  end
end
