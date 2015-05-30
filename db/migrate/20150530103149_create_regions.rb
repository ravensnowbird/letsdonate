class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :address
      t.string :lat
      t.string :long
      t.string :region_for
      t.integer :region_for_id

      t.timestamps null: false
    end
  end
end
