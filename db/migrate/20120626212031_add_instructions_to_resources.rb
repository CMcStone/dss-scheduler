class AddInstructionsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :instructions, :text
  end
end
