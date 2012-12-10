class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :provider_name
      t.string :provider_type

      t.timestamps
    end
  end
end
