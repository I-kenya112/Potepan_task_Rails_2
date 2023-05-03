class AddReserveDaysToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reserve_days, :integer
  end
end
