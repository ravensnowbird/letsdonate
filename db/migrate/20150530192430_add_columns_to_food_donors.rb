class AddColumnsToFoodDonors < ActiveRecord::Migration
  def change
    add_column :food_donors, :name, :string
    add_column :food_donors, :email, :string
    add_column :food_donors, :phone, :string
    add_column :food_donors, :food_details, :text
    add_column :food_donors, :address, :text
  end
end
