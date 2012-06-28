class AddPoolBooleanToResourceCategory < ActiveRecord::Migration
  def change
    add_column :resource_categories, :is_pool, :boolean
  end
end
