class AddReservePeopleToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reserve_people, :integer
    change_column :reservations, :reserve_start, :date
    change_column :reservations, :reserve_end, :date
  end
end
