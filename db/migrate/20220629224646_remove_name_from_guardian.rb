class RemoveNameFromGuardian < ActiveRecord::Migration[7.0]
  def change
    remove_column :api_v1_guardians, :name
  end
end
