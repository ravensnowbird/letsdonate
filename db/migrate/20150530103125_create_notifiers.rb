class CreateNotifiers < ActiveRecord::Migration
  def change
    create_table :notifiers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :ngo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
