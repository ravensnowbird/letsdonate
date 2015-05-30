class CreateFoodDonors < ActiveRecord::Migration
  def change
    create_table :food_donors do |t|
      t.boolean :has_transport
      t.string :available_till
      t.string :address
      t.string :lat
      t.string :long
      t.string :sufficient_for

      t.timestamps null: false
    end
  end
end
