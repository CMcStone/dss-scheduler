class AlterPublicAndRolesResourceBooleans < ActiveRecord::Migration
  def change
    remove_column :resources, :allow_anonymous
    add_column :resources, :role_required, :boolean
    add_column :resources, :allow_public, :boolean
  end
end
