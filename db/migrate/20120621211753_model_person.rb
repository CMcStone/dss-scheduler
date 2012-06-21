class ModelPerson < ActiveRecord::Migration
  def change
    add_column :people, :uid, :integer
    add_column :people, :guest_token, :string
    add_column :people, :guest_email, :string
  end
end
