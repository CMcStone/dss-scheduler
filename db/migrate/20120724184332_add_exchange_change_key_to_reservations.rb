class AddExchangeChangeKeyToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :exchange_change_key, :string
  end
end
