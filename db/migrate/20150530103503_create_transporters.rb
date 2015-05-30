class CreateTransporters < ActiveRecord::Migration
  def change
    create_table :transporters do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
