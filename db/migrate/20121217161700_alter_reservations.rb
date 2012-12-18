class AlterReservations < ActiveRecord::Migration
  def change
    alter_table :reservations do |t|
      t.datetime :start_time
      t.integer :service_id
      t.integer :user_id
      t.integer :shop_id
      t.timestamps
    end
  end
end
