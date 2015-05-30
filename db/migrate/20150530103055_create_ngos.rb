class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.string :name
      t.string :address
      t.string :lat
      t.string :lang

      t.timestamps null: false
    end
  end
end
