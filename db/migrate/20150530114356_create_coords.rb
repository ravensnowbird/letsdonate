class CreateCoords < ActiveRecord::Migration
  def change
    create_table :coords do |t|
      t.string :lat
      t.string :long
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
