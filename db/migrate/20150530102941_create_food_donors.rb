class CreateFoodDonors < ActiveRecord::Migration
  def change
    create_table :food_donors do |t|
      t.boolean :has_transport
      t.string :available_till
      t.integer :sufficient_for

      t.timestamps null: false
    end
  end
end
