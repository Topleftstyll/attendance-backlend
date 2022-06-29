class AddGuardianToChild < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_children, :guardian_id, :integer
  end
end
