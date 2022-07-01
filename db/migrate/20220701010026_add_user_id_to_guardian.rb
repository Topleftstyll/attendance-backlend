class AddUserIdToGuardian < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_guardians, :user_id, :integer
  end
end
