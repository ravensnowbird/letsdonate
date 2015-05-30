class AddUserIdToNgos < ActiveRecord::Migration
  def change
    add_column :ngos, :user_id, :integer, :index => true
  end
end
