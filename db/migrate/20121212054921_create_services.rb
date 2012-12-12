class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.integer :shop_id
      t.integer :length

      t.timestamps
    end
  end
end
