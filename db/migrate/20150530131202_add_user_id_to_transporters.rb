class AddUserIdToTransporters < ActiveRecord::Migration
  def change
    add_column :transporters, :user_id, :integer
  end
end
