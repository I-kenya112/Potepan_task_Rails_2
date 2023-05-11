class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :reserve_start
      t.datetime :reserve_end
      t.bigint :reserve_price
      t.bigint :reserve_total

      t.timestamps
    end
  end
end
