class AddTitleAndDescriptionToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :title, :string
    add_column :reservations, :description, :text
  end
end
