class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.integer :service_id
      t.integer :user_id

      t.timestamps
    end
  end
end
