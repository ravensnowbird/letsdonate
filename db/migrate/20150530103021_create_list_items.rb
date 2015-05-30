class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :name
      t.string :quantity
      t.references :food_donor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
