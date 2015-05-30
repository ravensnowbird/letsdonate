class CreateFoodResponces < ActiveRecord::Migration
  def change
    create_table :food_responces do |t|
      t.references :ngo, index: true, foreign_key: true
      t.references :food_donor, index: true, foreign_key: true
      t.string :status
      t.boolean :has_transport

      t.timestamps null: false
    end
  end
end
