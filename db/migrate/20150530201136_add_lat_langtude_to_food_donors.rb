class AddLatLangtudeToFoodDonors < ActiveRecord::Migration
  def change
    add_column :food_donors, :lat, :string
    add_column :food_donors, :lang, :string
  end
end
